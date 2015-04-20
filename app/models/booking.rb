class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  validates :check_in,    presence: true
  validates :check_out,   presence: true
  validates :total_price, presence: true
  validates :user,        presence: true
  validates :flat,        presence: true
end
