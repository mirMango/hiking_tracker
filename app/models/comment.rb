class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  validates :body, presence: true
end
