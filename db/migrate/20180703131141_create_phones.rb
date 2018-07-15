class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :value
      t.belongs_to :setting, foreign_key: true

      t.timestamps
    end
  end
end
