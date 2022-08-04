class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_movements, dependent: :destroy
  has_many :movements, through: :category_movements

  validates :name, presence: true, length: { maximum: 16 }

  def balance
    movements.sum(:amount)
  end
end
