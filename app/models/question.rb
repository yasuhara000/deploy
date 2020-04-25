class Question < ApplicationRecord
    belongs_to :user
    belongs_to :engineer,optional: true
    has_many :answers,dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :notifications, dependent: :destroy
    validates :title, presence: true
    validates :question, presence: true
    accepts_nested_attributes_for :answers
    is_impressionable counter_cache: true
    def self.search(search)
        return Question.all unless search
        Question.where(['title LIKE ?', "%#{search}%"])
    end
    enum status: {未解決: 0, 解決済: 1}
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

   
    def create_notification_answer!(current_engineer, answer_id)
       
        save_notification_answer!(current_engineer, answer_id, user_id) 
    end

    def save_notification_answer!(current_engineer, answer_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_engineer.active_notifications.new(
        question_id: id,
        answer_id: answer_id,
        visited_id:visited_id,
        action: 'answer'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end


end
