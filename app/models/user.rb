require 'bcrypt'

class User < ApplicationRecord
  # パスワードを設定（暗号化して保存）
  def set_password(plain_password)
    self.pass = BCrypt::Password.create(plain_password)
  end

  # 認証（平文パスワードと比較）
  def authenticate(plain_password)
    BCrypt::Password.new(self.pass) == plain_password
  end
end
