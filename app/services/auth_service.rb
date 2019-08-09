# frozen_string_literal: true

class AuthService
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def initialize(user)
    @user = user
  end

  def encode
    payload = {
      user_email: @user.email,
      school_id: @user.school.id
    }
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
