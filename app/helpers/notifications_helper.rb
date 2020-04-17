module NotificationsHelper

    def notification_form(notification)
        @e_visiter = notification.e_visiter
        @visiter = notification.visiter_id
        @answer = nil
        your_item = link_to 'あなたの投稿', answer_path(notification), style:"font-weight: bold;"
        @visiter_answer = notification.answer_id
        #notification.actionがfollowかlikeかcommentか
        case notification.action
          when "review" then
          tag.a(notification.visiter.nickname, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの解答', style:"font-weight: bold;")+"に評価をつけました"
          when "like" then
            tag.a(notification.visiter.nickname, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの解答', href:answer_path(notification.answer_id), style:"font-weight: bold;")+"にいいねしました"
          when "answer" then
              @answer = Answer.find_by(id: @visiter_answer)&.question
              tag.a(@e_visiter.nickname, href:engineer_path(@e_visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの質問', href:question_path(notification.question_id), style:"font-weight: bold;")+"に回答しました"
        end
      end
      

    def e_unchecked_notifications
        @notifications = current_engineer.passive_notifications.where(checked: false)
    end
    def unchecked_notifications
        @notifications = current_user.passive_notifications.where(checked: false)
    end

end
