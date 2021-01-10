# users  class
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_url
    elsif
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # todo create validate class
  # todo validate email
  # todo validate password max min length
  # todo add columns unique true

  def validate_name
    return false if user_params[:name].present?
  end

  def validate_email
    return false if user_params[:email].present?
  end

  def validate_password
    return false if user_params[:password].present?
  end
end
