class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_url, success: 'プロフィールを編集しました'
    else
      flash.now[:danger] = 'プロフィールの編集に失敗しました'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(
      :user_name,
      :email,
      :user_image
    )
  end
end
