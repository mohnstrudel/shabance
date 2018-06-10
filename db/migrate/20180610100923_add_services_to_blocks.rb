class AddServicesToBlocks < ActiveRecord::Migration[5.2]
  def change
    add_reference :blocks, :service, foreign_key: true
  end
end
