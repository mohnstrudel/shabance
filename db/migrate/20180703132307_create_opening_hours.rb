class CreateOpeningHours < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hours do |t|
      t.string :title
      t.string :value
      t.belongs_to :setting, foreign_key: true

      t.timestamps
    end
  end
end
