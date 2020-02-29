class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @tag_list = params[:post][:tag].split(',').join(',')
    if @post.save
      @post.save_posts(@tag_list)
      redirect_to posts_url, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @tag_list = @post.tags.pluck(:tag).join(',')
  end

  def update
    @tag_list = params[:post][:tag].split(',').join(',')
    if @post.update(post_params)
      @post.save_posts(@tag_list)
      redirect_to post_url, success: '投稿を編集しました'
    else
      flash.now[:danger] = '投稿の編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url, success: '投稿を削除しました'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :youtube_url)
  end
end
