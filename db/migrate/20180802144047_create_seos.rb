class CreateSeos < ActiveRecord::Migration[5.2]
  def change
    create_table :seos do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :keywords, default: [], array: true

      t.timestamps
    end
  end
end
