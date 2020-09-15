class PostsController < ApplicationController
  before_action :login_required
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.user_id = current_user.id
      if @post.save
      redirect_to post_path(@post)
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "削除されました"
    redirect_to posts_path
  end

  private

  def login_required
      redirect_to login_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
