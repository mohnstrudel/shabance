class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :logo, :string
    add_column :posts, :gallery, :string
    add_column :posts, :cite, :string
    add_column :posts, :video, :string
    add_column :posts, :link, :string
  end
end
