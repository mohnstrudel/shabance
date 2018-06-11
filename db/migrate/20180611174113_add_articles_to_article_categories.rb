class AddArticlesToArticleCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :article_categories, :article, foreign_key: true
  end
end
