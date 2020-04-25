class Engineer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers,dependent: :destroy
  has_many :questions
  validates :name, presence: true
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :active_notifications, class_name: "Notification", foreign_key: "e_visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "e_visited_id", dependent: :destroy
end
