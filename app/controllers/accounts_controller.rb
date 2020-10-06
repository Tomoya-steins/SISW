class AccountsController < ApplicationController
  before_action :admin_user, only: :destroy
  
  def index
    @users_info = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "削除されました"
    redirect_to accounts_path
  end

  def edit
    @info = User.find(params[:id])
  end

  def update
    @info = User.find(params[:id])
    if @info.update_attributes(user_params)
      redirect_to accounts_path, notice: "更新されました"
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
   end

  private
  def user_params
    params.require(:user).permit(:name, :account_id, :email)
  end

  def admin_user
    redirect_to(login_path) unless current_user.admin?
      
  end
end
