class AddLogoToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :logo, :string
  end
end
