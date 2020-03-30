class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :questions, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  attachment :profile_image
  is_impressionable counter_cache: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
end
