class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        User.update!(params_user)
        redirect_to user_path(current_user)
    end
    private
    def params_user
        params.require(:user).permit(:image_id, :profile)
    end
end
