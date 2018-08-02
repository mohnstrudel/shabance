class AddReferencesToSeos < ActiveRecord::Migration[5.2]
  def change
    add_reference :seos, :post, foreign_key: true
    add_reference :seos, :case, foreign_key: true
    add_reference :seos, :article, foreign_key: true
    add_reference :seos, :service, foreign_key: true
  end
end
