# module Authenticator
module JwtAuthenticator
  extend ActiveSupport::Concern

  included do
    before_action :jwt_checker, only: [:jwt_authenticate]
  end

  SECRET_KEY_BASE = Rails.application.secrets.secret_key_base

  def jwt_authenticate
    return unauthoraization_error if decoded_token.nil?

    current_user = User.find_by(id: decoded_token[:id])
    current_user
  end

  def encode(id:, name:)
    # jwt epxpire 1 hour
    payload = {
      id: id,
      name: name,
      exp: 1.hours.from_now.to_i
    }
    JWT.encode(payload, SECRET_KEY_BASE, 'HS256')
  end

  private

  def jwt_checker
    render_401('http header token empty.') if request.headers['Authorization'].blank?
  end

  def unauthoraization_error
    render_401('Either you should be sign in or token is expired or wrong')
  end

  def decoded_token
    body = JWT.decode(encoded_token, SECRET_KEY_BASE, algorithm: 'HS256').first
    HashWithIndifferentAccess.new body
  rescue JWT::VerificationError
    nil
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::DecodeError
    nil
  end

  def encoded_token
    request.headers['Authorization'].split('Bearer ').last
  end
end
