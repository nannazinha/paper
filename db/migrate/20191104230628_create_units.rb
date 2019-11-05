class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name
      t.string :address
      t.string :manager
      t.string :cnpj
      t.string :bank
      t.string :agency
      t.string :account_number
      t.string :rooms_qty
      t.references :admin, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
