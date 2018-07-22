class RenameColumnsMultiplication < ActiveRecord::Migration[5.1]
  def change
    rename_column :multiplications, :max_multiplicand, :multiplicand
    rename_column :multiplications, :max_multiplier, :multiplier
  end
end
