class MonetizeBooking < ActiveRecord::Migration
  def change
      change_table :bookings do |t|
      t.monetize :price
    end
  end
end
