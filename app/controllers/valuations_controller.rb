class ValuationsController < ApplicationController
    def new
        @valuation = Valuation.new
    end
    
    def create
        @valuation = Valuation.new(params_valuation)
        @valuation.user_id = current_user.id
        @valuation.engineer_id = params[:engineer_id]
        @valuation.save!
        redirect_to engineer_valuations_path
    end
    def index
        @valuations = Valuation.where(engineer_id:params[:id])
    end
    def params_valuation
        params.require(:valuation).permit(:title, :comment,:status)
    end
end
