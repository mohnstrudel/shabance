class AddSlugToArticleCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :article_categories, :slug, :string
    add_index :article_categories, :slug, unique: true
  end
end
