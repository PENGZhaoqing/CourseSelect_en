class SessionsController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  skip_before_filter :navside, :navbar, :to_parse_path

  def create
    # render json: auth_hash.as_json
    if current_user
      @user=current_user
      if @user.path==auth_hash[:info][:path] && @user.node==auth_hash[:info][:node]
        #do nothing
      else
        @user.path=auth_hash[:info][:path]
        @user.node=auth_hash[:info][:node]
        @user.save
      end
    else
      @user=User.new
      @user.name=auth_hash[:info][:name]
      @user.node=auth_hash[:info][:node]
      @user.path=auth_hash[:info][:path]
      @user.role=auth_hash[:info][:role]
      @user.department=auth_hash[:info][:departments]
      @user.save
      user_log_in(@user)
      remember_user(@user)
    end

    @parsed_path=path_parse(@user.node, @user.path)
    navbar_node=default_traversal([1], @parsed_path).sort.first
    navside_node=default_traversal([1]<<navbar_node, @parsed_path).sort.first
    redirect_to construct_path(navbar_node, navside_node)
  end


  def destroy_user
    user_log_out if user_logged_in?
    redirect_to "http://livedemo.01fanli.com/home/index"
  end

  def failure
    flash[:notice]='Login failure,please try it again'
    redirect_to "http://livedemo.01fanli.com", alert: 'Login failure,please try it again'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
