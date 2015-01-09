class User < ActiveRecord::Base
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(entered_password)
    self.password_hash == entered_password
  end
end
