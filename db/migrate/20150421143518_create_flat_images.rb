class CreateFlatImages < ActiveRecord::Migration
  def change
    create_table :flat_images do |t|
      t.references :flat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
