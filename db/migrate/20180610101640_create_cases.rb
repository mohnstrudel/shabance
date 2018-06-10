class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.string :title
      t.string :body
      t.string :slug

      t.timestamps
    end
    add_index :cases, :slug, unique: true
  end
end
