class AddServiceQuantityToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_reference :invoices, :service_quantity, foreign_key: true
  end
end
