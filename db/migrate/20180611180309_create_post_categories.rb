class CreatePostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories do |t|
      t.string :title
      t.string :slug
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :post_categories, :slug, unique: true
  end
end
