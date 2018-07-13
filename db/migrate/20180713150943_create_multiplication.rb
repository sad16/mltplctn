class CreateMultiplication < ActiveRecord::Migration[5.1]
  def change
    create_table :multiplications do |t|
      t.integer :max_multiplicand, null: false
      t.integer :max_multiplier, null: false
      t.integer :sum

      t.timestamps
    end
  end
end
