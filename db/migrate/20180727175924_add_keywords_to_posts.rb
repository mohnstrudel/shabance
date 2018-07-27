class AddKeywordsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :keywords, :text
  end
end
