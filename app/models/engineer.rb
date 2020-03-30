class Engineer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers,dependent: :destroy
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
