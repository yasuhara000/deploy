class LikesController < ApplicationController
    def create
        @answer = Answer.find(params[:id])
        @like = Like.create(user_id: current_user.id, answer_id: @answer.id)
        @answer.create_notification_by(current_user)
        respond_to do |format|
          format.html {redirect_to request.referrer}
          format.js
        end
      end
      def destroy
        @answer = Answer.find(params[:id])
        @like = Like.find_by(user_id: current_user.id, answer_id: @answer.id)
        @like.destroy
      end
      def set_variables
        @answer = Answer.find(parmas[:id])
      end
end
