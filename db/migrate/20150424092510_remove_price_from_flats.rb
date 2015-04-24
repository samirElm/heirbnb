class RemovePriceFromFlats < ActiveRecord::Migration
  def change
    remove_column :flats, :price, :money
  end
end
