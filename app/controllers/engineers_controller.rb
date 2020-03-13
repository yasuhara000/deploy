class EngineersController < ApplicationController
    def show
        @engineer = Engineer.find(params[:id])
    end
    def edit
        @engineer = Engineer.find(params[:id])
    end

    def update
        Engineer.update!(params_engineer)
        redirect_to engineer_path(current_engineer)
    end
    private
    def params_engineer
        params.require(:engineer).permit(:image_id, :profile)
    end
end
