class Result < ApplicationRecord
  belongs_to :user

  validates :subtitle, length: { maximum: 150 }, presence: true
  validates :title, length: { maximum: 100 }, presence: true
  validates :detail, length: { maximum: 65535 }
  validates :url, length: { maximum: 65535 }, presence: true
  validates :github, length: { maximum: 65535 }
end
