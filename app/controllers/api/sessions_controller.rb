# module api
module Api
  # session controller
  # user authentication json params
  # {"email": "your_email", "password": "your_password"}
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include JwtAuthenticator

    def create
      user = User.find_by(email: login_params[:email])
      if user.present? && user.authenticate(login_params[:password])
        log_in(user)
        render json: { status: 'login success', token: token(user) }
      else
        render_401('login failed')
      end
    end

    private

    def login_params
      params.require(:session).permit(:email, :password)
    end

    def token(user)
      encode(id: user.id, name: user.name)
    end
  end
end
