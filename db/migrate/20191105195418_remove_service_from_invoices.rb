class RemoveServiceFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invoices, :service, foreign_key: true
  end
end
