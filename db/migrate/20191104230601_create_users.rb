class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.integer :gender
      t.boolean :responsible
      t.string :sponsor
      t.string :sponsor_cpf
      t.string :phone_prefix
      t.string :phone_number
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :district
      t.string :street
      t.string :number
      t.string :complement
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
