class EngineersController < ApplicationController
    def show
        
        @engineer = Engineer.find(params[:id])
        @answers = Answer.where(engineer_id:params[:id]).page(params[:page]).reverse_order
        
        
       
    end
    def edit
        @engineer = Engineer.find(params[:id])
    end

    def update
        @engineer = Engineer.find(params[:id])
        @engineer.update(params_engineer)
        redirect_to engineer_path(current_engineer)
    end
    private
    def params_engineer
        params.require(:engineer).permit(:profile_image, :profile,:nickname)
    end
end
