class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :brand, presence: true
  validates :model, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: true
  validates :price_per_day, comparison: { greater_than: 0 }
end
