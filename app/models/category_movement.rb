class CategoryMovement < ApplicationRecord
  belongs_to :movement
  belongs_to :category
end
