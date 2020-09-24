class ForgotPasswordController < ApplicationController
    def input
    end

    def get
      @forgot = User.find_by(account_id: params[:account_id])
      if @forgot
        redirect_to "/#{@forgot}/change"
      else
        redirect_to forgot_path
      end
    end

    def change

    end

    def update

    end
end
