require 'bcrypt'

class User < ApplicationRecord
  def password=(plain_password)
    self.pass = BCrypt::Password.create(plain_password)
  end

  def authenticate(plain_password)
    BCrypt::Password.new(self.pass) == plain_password
  end
end
