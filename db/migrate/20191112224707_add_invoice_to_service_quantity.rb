class AddInvoiceToServiceQuantity < ActiveRecord::Migration[5.2]
  def change
    add_reference :service_quantities, :invoice, foreign_key: true
  end
end
