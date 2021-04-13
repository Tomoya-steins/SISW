class AccountActivationsController < ApplicationController

    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.activate
            # user.update_attribute(:activated, true)
            login user
            flash[:success] = "有効化しました!"
            redirect_to posts_path
        else
            flash[:danger] = "出来ませんでした。"
            redirect_to login_path
        end
    end
end
