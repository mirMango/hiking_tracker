class Hike < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  validates :distance, presence: true, numericality: { greater_than: 0 }
end
