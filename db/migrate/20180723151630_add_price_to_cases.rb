class AddPriceToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :price, :float
  end
end
