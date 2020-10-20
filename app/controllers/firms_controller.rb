class FirmsController < ApplicationController
    before_action :admin_user
    def index
      @firms = Firm.all
      @firm = Firm.new
    end

    def create
      @firm = Firm.new(firm_params)

        if @firm.save
           redirect_to firms_path
        else
            flash[:alert] = "保存できませんでした"
        end
    end

    def destroy
        Firm.find(params[:id]).destroy
        flash[:notice] = "削除されました"
        redirect_to firms_path
    end

    private

    def admin_user
        redirect_to(login_path) unless current_user.admin?
    end

    def firm_params
        params.require(:firm).permit(:firm_name)
    end
end
