class NotificationsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :authenticate_engineer!, only: [:index]
    def index
        #current_userの質問に紐づいた通知一覧
        if user_signed_in? 
            @notifications = current_user.passive_notifications.page(params[:page]).per(10)
            @notifications.where(checked: false).each do |notification|
                notification.update_attributes(checked: true)
            end
         #current_engineerの回答に紐づいた通知一覧
        elsif engineer_signed_in? 
            @notifications = current_engineer.passive_notifications.page(params[:page]).per(10)
            @notifications.where(checked: false).each do |notification|
                notification.update_attributes(checked: true)
            end
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