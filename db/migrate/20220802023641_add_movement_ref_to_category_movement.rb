class AddMovementRefToCategoryMovement < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_movements, :movement, null: false, foreign_key: true
  end
end
