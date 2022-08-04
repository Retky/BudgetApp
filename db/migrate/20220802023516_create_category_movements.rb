class CreateCategoryMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :category_movements do |t|

      t.timestamps
    end
  end
end
