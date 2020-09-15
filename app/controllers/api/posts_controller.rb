class Api::PostsController < ApplicationController
    skip_forgery_protection

    before_action :authenticate_by_token

    def index
        @posts = Post.all
        render json: @posts.map{ |post| {title: post.title}}
    end

    def show
        @post = Post.find(params[:id])
        render json: @post.image_id
    end

    private

    def authenticate_by_token
        @user = User.find_by(api_token: params[:api_token])
        render status: :unauthorized, json: 'Invalid Api token' if @user.blank?
    end

end