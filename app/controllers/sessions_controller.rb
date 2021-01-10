class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user.present? && user.authenticate(login_params[:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:alert] = 'emailまたはpasswordが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def login_params
    # strong paramterのkey名を変更する
    params.require(:user).permit(:email, :password)
  end
end
