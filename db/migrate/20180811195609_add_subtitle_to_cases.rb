class AddSubtitleToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :subtitle, :string
  end
end
