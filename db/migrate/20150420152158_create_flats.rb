class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.money :price
      t.string :city
      t.integer :capacity
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
