class Result < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :detail, length: { mximum: 65535 }
  validates :url, length: { mximum: 65535 }
  validates :github, length: { mximum: 65535 }
end
