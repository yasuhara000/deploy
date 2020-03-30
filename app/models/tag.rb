class Tag < ApplicationRecord
    has_many :post_tags,dependent: :destroy
    has_many :questions, through: :post_tags
end
