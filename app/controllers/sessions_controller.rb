class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
      flash= {:info => "欢迎回来: #{user.name} :)"}
    else
      flash= {:danger => '账号或密码错误'}
    end
    redirect_to root_url, :flash => flash
  end

  def callback
    # render json: auth_hash.as_json
    if current_user
      update_change(auth_hash, current_user)
    elsif !User.find_by(email: auth_hash[:info][:email]).nil?
      @user=User.find_by(email: auth_hash[:info][:email])
      update_change(auth_hash, @user)
      log_in(@user)
      redirect_to root_path, flash: {:info => "欢迎回来: #{@user.name} :)"}
    else
      @user = User.new
      @user.name=auth_hash[:info][:name]
      @user.num=auth_hash[:info][:num]
      @user.teacher=true if ["professor", "assoicate professor", "executive stuff"].include?(auth_hash[:info][:role])
      @user.email=auth_hash[:info][:email]
      @user.major=auth_hash[:info][:major]
      @user.department=auth_hash[:info][:department]
      @user.node=auth_hash[:info][:node]
      @user.path=auth_hash[:info][:path]
      @user.password="password"
      @user.password_confirmation="password"
      if @user.save!
        log_in(@user)
        redirect_to root_url, flash: {success: "欢迎新用户: #{@user.name} :)"}
      else
        redirect_to root_url, flash: {danger: "授权过程出现问题,请重试"}
      end
    end
  end

  def new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def update_change(auth_hash, user)
    user.update(path: auth_hash[:info][:path]) if user.path!=auth_hash[:info][:path]
    user.update(node: auth_hash[:info][:node]) if user.node!=auth_hash[:info][:node]
    user.update(email: auth_hash[:info][:email]) if user.email!=auth_hash[:info][:email]
    user.update(name: auth_hash[:info][:name]) if user.name!=auth_hash[:info][:name]
    user.update(num: auth_hash[:info][:num]) if user.num!=auth_hash[:info][:num]
    user.update(teacher: true) if ["professor", "assoicate professor", "executive stuff"].include?(auth_hash[:info][:role])
    user.update(department: auth_hash[:info][:department]) if user.department!=auth_hash[:info][:department]
    user.update(major: auth_hash[:info][:major]) if user.major!=auth_hash[:info][:major]
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
