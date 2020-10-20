class PersonalController < ApplicationController
  def show
    @personal = User.find(params[:id])
  end

  def edit
    @personal = User.find(params[:id])
  end

  def update

    @personal = User.find(params[:id])
    if @personal.update(user_params)
      redirect_to personal_path, notice: "更新されました"
    else
      render :edit
      flash[:alert] = "保存できませんでした"
    end
  end

  def password_edit
    @personal = User.find(params[:id])
  end

  def password_update
    @personal = User.find(params[:id])
    if cureent_user.name == @personal.name && cureent_user.belonging == @personal.belonging
      if @personal.update(user_password_params)
        redirect_to personal_path
      else
        flash.now[:danger] = "編集に失敗しました"
        render :edit
      end
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :profile)
  end

  def user_password_params
    params.require.(:user).permit(:password, :password_confirmation)
  end
end
