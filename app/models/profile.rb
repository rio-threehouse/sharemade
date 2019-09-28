class Profile < ApplicationRecord
  belongs_to :user

  validates :yourself, length: { maximum: 150 }
  validates :skill, length: {maximum: 150 }
  validates :twitter_account, length: { maximum: 15 }
  validates :github_account, length: { maximum: 200 }
end
