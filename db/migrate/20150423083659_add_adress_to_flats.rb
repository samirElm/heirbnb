class AddAdressToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :address, :string
  end
end
