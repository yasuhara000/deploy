class EngineersController < ApplicationController
    before_action :authenticate_engineer!, only: [:edit,:update]
    def show
        @engineer = Engineer.find(params[:id])
        @answers = Answer.where(engineer_id:params[:id]).page(params[:page]).reverse_order       
    end

    def edit
        @engineer = Engineer.find(params[:id])
        if @engineer != current_engineer
            redirect_to engineer_path(@engineer)
        end
    end

    def update
        @engineer = Engineer.find(params[:id])
        if @engineer.update(params_engineer)
            redirect_to engineer_path(current_engineer)
        else
            render :edit
        end
    end 

    private
    def params_engineer
        params.require(:engineer).permit(:profile_image, :profile, :name)
    end

end
