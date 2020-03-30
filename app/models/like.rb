class Like < ApplicationRecord
    belongs_to :answer, counter_cache: :likes_count
    belongs_to :user
end
