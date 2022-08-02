class Category < ApplicationRecord
  belongs_to :user
  has_many :movement_details, dependent: :destroy
  has_many :movements, through: :movement_details

  validates :name, presence: true, length: { maximum: 16 }
end
