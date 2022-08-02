class User < ApplicationRecord
  has_many :movements, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 16 }
end
