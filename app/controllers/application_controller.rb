class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery

  private
  # ログインしていないユーザーはredirectする
  # controllerでbefore_actionで設定すること
  # ex) before_action :logged_in_user, only:[:edit, :update, :destroy]
  def logged_in_uder
    redirect_to login_url unless logged_in?
  end
end
