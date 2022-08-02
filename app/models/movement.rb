class Movement < ApplicationRecord
  belongs_to :user
  has_many :category_movements, dependent: :destroy
  has_many :categories, through: :category_movements

  validates :name, presence: true, length: { maximum: 16 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.00 }
end