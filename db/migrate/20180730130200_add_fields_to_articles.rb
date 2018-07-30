class AddFieldsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :video, :string
    add_column :articles, :cite, :string
    add_column :articles, :logo, :string
    add_column :articles, :link, :string
    add_column :articles, :images, :string
    add_column :articles, :featured, :boolean
    add_column :articles, :keywords, :text
  end
end
