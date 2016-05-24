class User < ActiveRecord::Base

  attr_accessor :remember_token

  serialize :node, Array
  serialize :path, Array

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def user_remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def user_authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def user_forget
    update_attribute(:remember_digest, nil)
  end


  def has_right?(path)
    result=false
    path= path.join('').to_i
    self.path.each do |item|
      if item==path
        result=true
        break
      end
    end
    return result
  end


end
