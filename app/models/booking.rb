class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat
  monetize   :price_cents

  validates :check_in,    presence: true
  validates :check_out,   presence: true
  validates :price_cents, presence: true
  validates :user,        presence: true
  validates :flat,        presence: true
end
