class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      # UserMailer.account_activation(@user).deliver_now
      flash[:info] = "入力されたEメールから有効化をお願いします。"
      redirect_to signup_wait_path
    else
    render :new
    end
  end

  def new_firm
    @user = User.new
  end

  def create_firm
    @user = User.new(firm_params)
    @user.name = @user.belonging
    if Firm.find_by(firm_name: "#{@user.name}")
    if @user.save
      @user.send_activation_email
      # UserMailer.account_activation(@user).deliver_now
      flash[:info] = "入力されたEメールから有効化をお願いします。"
      redirect_to signup_wait_path
    else
    render :new_firm
    end
  else
    render :new_firm
  end
  end

  def wait
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :belonging, :email, :password, :password_confirmation)
  end

  def firm_params
    params.require(:user).permit(:belonging, :email, :password, :password_confirmation)
  end

end
