# module Authenticator
module JwtAuthenticator
  extend ActiveSupport::Concern

  SECRET_KEY_BASE = Rails.application.secrets.secret_key_base

  def encode(id:, name:)
    # jwt epxpire 1 hour
    payload = {
      id: id,
      name: name,
      exp: 1.hours.from_now.to_i
    }
    JWT.encode(payload, SECRET_KEY_BASE, 'HS256')
  end

  def decode(token)
    body = JWT.decode(token, SECRET_KEY_BASE, algorithm: 'HS256').first
    HashWithIndifferentAccess.new body
  rescue JWT::VerificationError
    nil
  rescue JWT::ExpiredSignature
    nil
  end
end
