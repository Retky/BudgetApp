class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movements, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 16 }

  def balance
    movements.sum(:amount)
  end
end