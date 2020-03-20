class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @questions = Question.where(user_id:params[:id])
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update!(params_user)
        redirect_to user_path(current_user)
    end

    private
    def params_user
        params.require(:user).permit(:image_id, :profile,:name)
    end
end
