class AddBlocksToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :block, foreign_key: true
  end
end
