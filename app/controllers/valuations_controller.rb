class ValuationsController < ApplicationController
    PER = 5
    def new
        @valuation = Valuation.new
        @engineer = Engineer.find(params[:engineer_id])
    end
    
    def create
        @valuation = Valuation.new(params_valuation)
        @valuation.user_id = current_user.id
        @valuation.engineer_id = params[:engineer_id]
        @valuation.status = params[:review][:star]
       if @valuation.save!
        @valuation.create_notification_review(current_user)
        redirect_to engineer_valuations_path
       end
    end
    def index
        @valuations = Valuation.where(engineer_id:params[:engineer_id]).page(params[:page]).reverse_order.per(PER)
    end
    def params_valuation
        params.require(:valuation).permit(:title, :comment,:status,:engineer_id)
    end
end
