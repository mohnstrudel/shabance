class CreateContactRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :subject
      t.text :body
      t.string :page_reference

      t.timestamps
    end
  end
end
