class Valuation < ApplicationRecord
    belongs_to :user
    belongs_to :engineer
    has_many :notifications, dependent: :destroy
    validates :comment, presence: true
    validates :status, presence: true
    def create_notification_review(current_user)
        notification = current_user.active_notifications.new(
          valuation_id: id,
          e_visited_id: engineer_id,
          action: "review"
        )
        notification.save if notification.valid?
    end
end
