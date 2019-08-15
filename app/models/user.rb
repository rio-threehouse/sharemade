class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, length: { maximum: 20 }
         validates :yourself, length: { maximum: 150 }
         validates :skill, length: {maximum: 150 }
  
  has_many :results, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_results, through: :goods, source: :result
end
