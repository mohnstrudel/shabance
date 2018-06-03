class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.text :leading_description
      t.text :ending_description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
