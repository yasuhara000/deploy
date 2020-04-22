class Answer < ApplicationRecord
    belongs_to :engineer
    belongs_to :question,optional: true
    has_many :likes, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    def create_notification_by(current_user)
        notification = current_user.active_notifications.new(
          answer_id: id,
          e_visited_id: engineer_id,
          action: "like"
        )
        notification.save! if notification.valid?
    end
   
end
