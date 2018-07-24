class FixPostsColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :gallery, :images
  end
end
