class User < ActiveRecord::Base
  def password
    @password ||= BCrypt::Password.new(password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password = @password
  end

  def authenticate?(entered_password)
    self.password == entered_password
  end
end