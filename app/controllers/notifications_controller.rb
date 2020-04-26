class NotificationsController < ApplicationController
    
   
    
    def index
        #current_userの質問に紐づいた通知一覧
        if user_signed_in? 
            @notifications = current_user.passive_notifications.page(params[:page]).per(10)
            @notifications.where(checked: false).each do |notification|
                notification.update_attributes(checked: true)
            end
            @current_user = User.find_by(id: params[:user_id])
            if @current_user != current_user
                redirect_to questions_path
            end
            
         #current_engineerの回答に紐づいた通知一覧
        elsif engineer_signed_in? 
            @notifications = current_engineer.passive_notifications.page(params[:page]).per(10)
            @notifications.where(checked: false).each do |notification|
                notification.update_attributes(checked: true)
            end
            @current_engineer = Engineer.find_by(id: params[:engineer_id])
            if @current_engineer != current_engineer
                redirect_to questions_path
            end
        else
            redirect_to questions_path
        end
        

    end

    def destroy_all
        #通知を全削除
        if user_signed_in? 
            @notifications = current_user.passive_notifications.destroy_all
            redirect_to user_notifications_path(current_user)
        elsif engineer_signed_in? 
            @notifications = current_engineer.passive_notifications.destroy_all
            redirect_to engineer_notifications_path(current_engineer)

        end
    end
end