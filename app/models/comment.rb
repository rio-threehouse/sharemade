class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :result

  validates :comment, presence: true, length: { maximum: 255 }
end
