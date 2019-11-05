class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.integer :role
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
