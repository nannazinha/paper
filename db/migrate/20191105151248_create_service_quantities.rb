class CreateServiceQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :service_quantities do |t|
      t.integer :quantity
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
