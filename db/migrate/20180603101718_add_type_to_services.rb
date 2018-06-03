class AddTypeToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :service_type, :string
  end
end
