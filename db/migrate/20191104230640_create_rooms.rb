class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :number
      t.boolean :shared
      t.boolean :rented
      t.string :price
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
