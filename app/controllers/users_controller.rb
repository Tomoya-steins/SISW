class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "入力されたEメールから有効化をお願いします。"
      redirect_to login_path
    else
    render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :account_id, :email, :password, :password_confirmation)
  end
end
