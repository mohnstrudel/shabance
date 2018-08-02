class AddSettingsToSeos < ActiveRecord::Migration[5.2]
  def change
    add_reference :seos, :setting, foreign_key: true
  end
end
