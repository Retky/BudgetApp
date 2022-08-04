class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.float :amount, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
