class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :questions, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  attachment :profile_image
  is_impressionable counter_cache: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
