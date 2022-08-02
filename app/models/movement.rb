class Movement < ApplicationRecord
  belongs_to :user
  has_many :movement_details, dependent: :destroy

  validates :name, presence: true, length: { maximum: 16 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.00 }
end
