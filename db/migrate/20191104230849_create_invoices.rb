class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.date :pay_date
      t.string :items_description
      t.string :fees
      t.string :total
      t.string :link
      t.string :status
      t.integer :slip_days
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
