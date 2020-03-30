class Answer < ApplicationRecord
    belongs_to :engineer
    belongs_to :question,optional: true
    has_many :likes, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end


end
