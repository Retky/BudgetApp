class AddCategoryRefToCategoryMovement < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_movements, :category, null: false, foreign_key: true
  end
end
