class UsersController < ApplicationController

  def top
    @posts = Post.all.order(created_at: :desc).limit(3)
    @firm = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      # UserMailer.account_activation(@user).deliver_now
      redirect_to signup_wait_path, info: "入力されたEメールから有効化をお願いします。"
    else
    flash.now[:danger] = "失敗しました。"
    render :new
    end
  end

  def new_firm
    @user = User.new
  end

  def create_firm
    @user = User.new(firm_params)
    @user.name = @user.belonging
    if Firm.find_by(firm_name: "#{@user.belonging}")
      if @user.save
        @user.send_activation_email
        # UserMailer.account_activation(@user).deliver_now
        redirect_to signup_wait_path, info: "入力されたEメールから有効化をお願いします。"
      else
      flash.now[:danger] = "失敗しました。"
      render :new_firm
      end
    else
      flash.now[:danger] = "失敗しました。"
      render :new_firm
    end
  end

  def wait
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :belonging, :email, :password, :password_confirmation, :department, :birthplace)
  end

  def firm_params
    params.require(:user).permit(:belonging, :email, :password, :password_confirmation)
  end

end
