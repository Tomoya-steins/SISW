class PostsController < ApplicationController
  before_action :login_required
  before_action :set_post, only: %i[destroy]
  def index
    @posts = Post.all
  end

  def create
    @post = Post.create!(post_params)
  end

  def destroy
    @post.destroy!
  end

  # def new
  #   @post = Post.new
  # end

  # def create
  #   @post = Post.new(post_params)
  #   if @post.user_id = current_user.id
  #     if @post.save
  #     redirect_to root_path
  #     else
  #       render :new
  #     end
  #   else
  #     render :new
  #   end
  # end

  #def show
   # @post = Post.find(params[:id])
  #end

  #def edit PDFをindexに全て集約させたため
  #  @post = Post.find(params[:id])
  #end

  #def update
   # @post = Post.find(params[:id])
    #if @post.update(post_params)
     # redirect_to post_path(@post)
    #else
     # render :edit
    #end
  #end

  # def destroy
  #   post = Post.find(params[:id])
  #   post.pdf_file.purge
  #   post.destroy
  #   flash[:notice] = "削除されました"
  #   redirect_to posts_path
  # end

  private

  def login_required
      redirect_to login_path unless logged_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  #仮置き
  def post_params
    params.require(:post).permit(:user_id, :body)
  end
  # def post_params
  #   params.require(:post).permit(:user_id, :title, :pdf_file)
  # end
end
