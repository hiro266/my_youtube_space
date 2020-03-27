class ApplicationController < ActionController::Base
  add_flash_types :danger, :success, :warning
  before_action :require_login

  protected

  def not_authenticated
    redirect_to login_url, danger: 'ログインしてください'
  end
end
