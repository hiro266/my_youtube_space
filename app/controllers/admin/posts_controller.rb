class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[show edit update destroy]
  layout 'admin'

  def index
    @posts = Post.includes(:user).new_order.page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_post_url, success: '掲示板を更新しました'
    else
      flash.now[:danger] = '掲示板を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to admin_posts_url, success: '掲示板を削除しました'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post)
          .permit(:title, :body, :post_image)
  end
end
