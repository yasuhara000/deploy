class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit,:update]
    def show
        @user = User.find(params[:id])
        @questions = Question.where(user_id:params[:id]).page(params[:page]).reverse_order
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update!(params_user)
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    private
    def params_user
        params.require(:user).permit(:profile_image, :profile,:name,:nickname)
    end
end
