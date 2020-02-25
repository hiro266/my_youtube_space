class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @posts = current_user.posts.includes(:user)
    # @post = Post.find(1)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_url, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :youtube_url)
  end
end
