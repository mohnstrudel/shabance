class CreateNewsletterRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletter_requests do |t|
      t.string :email

      t.timestamps
    end
  end
end
