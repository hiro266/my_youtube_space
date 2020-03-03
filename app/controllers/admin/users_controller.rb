class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]
  layout 'admin'

  def index
    @q = User.ransack(params[:q]) # 検索オブジェクト作成
    @users = @q.result.new_order.page(params[:page]) # 検索結果(何もなければ全件取得)
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_url, success: 'ユーザーを更新しました'
    else
      flash.now[:danger] = 'ユーザーを更新できませんでした'
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_root_url, success: 'ユーザーを削除しました'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :user_name,
      :user_image,
      :role
    )
  end
end
