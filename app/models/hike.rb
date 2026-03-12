class Hike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence:true
  validates :distance, presence: true, numericality: { greater_than: 0 }
end
