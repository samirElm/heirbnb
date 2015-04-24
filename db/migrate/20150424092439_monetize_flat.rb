class MonetizeFlat < ActiveRecord::Migration
  def change
    change_table :flats do |t|
    t.monetize :price
    end
  end
end
