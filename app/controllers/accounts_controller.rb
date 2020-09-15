class AccountsController < ApplicationController
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
    if @info.update(user_params)
      redirect_to accounts_path, notice: "更新されました"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :account_id)
  end
end
