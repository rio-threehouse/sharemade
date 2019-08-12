class Result < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :detail, length: { maximum: 65535 }
  validates :url, length: { maximum: 65535 }
  validates :github, length: { maximum: 65535 }
end
