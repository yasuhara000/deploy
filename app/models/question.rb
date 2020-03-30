class Question < ApplicationRecord
    belongs_to :user
    has_many :answers,dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
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
end
