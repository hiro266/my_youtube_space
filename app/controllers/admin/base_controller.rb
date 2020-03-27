class Admin::BaseController < ApplicationController
  before_action :check_admin

  def not_authenticated
    redirect_to admin_login_url, warning: 'ログインしてください'
  end

  private

  def check_admin
    redirect_to root_url, warning: '権限がありません' unless current_user.admin?
  end
end
