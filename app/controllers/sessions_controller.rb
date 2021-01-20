class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(belonging: params[:session][:belonging], email: params[:session][:email])
        if user&.authenticate(params[:session][:password])
          if user.activated?
            login user
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
            redirect_to events_path, success: 'ログインしました!'
          else
            message = "有効化に失敗しました"
            flash[:warning] = message
            redirect_to login_path
          end
        else
            flash.now[:danger] = 'アカウントID、またはパスワードが間違っています'
            render :new
        end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
