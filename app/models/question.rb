class Question < ApplicationRecord
    belongs_to :user
    has_many :answers,dependent: :destroy
    is_impressionable counter_cache: true
end
