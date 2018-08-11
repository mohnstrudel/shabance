class AddAuthorToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :author, :string
  end
end
