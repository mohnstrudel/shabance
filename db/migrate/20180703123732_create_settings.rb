class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :url
      t.string :address
      t.string :long
      t.string :lat
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
