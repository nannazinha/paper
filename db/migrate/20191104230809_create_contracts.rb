class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :number
      t.date :start
      t.date :finish
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
