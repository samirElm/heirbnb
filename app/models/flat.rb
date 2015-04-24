class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :flat_images, dependent: :destroy
  has_many :bookings,    dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  monetize :price_cents

  validates :user,        presence: true
  validates :title,       presence: true
  validates :description, presence: true
  validates :capacity,    presence: true
  validates :address,     presence: true
  validates :price_cents, presence: true
  validates :flat_images, presence: true

  accepts_nested_attributes_for :flat_images #, reject_if: proc { |image|
# binding.pry
#     !image.picture.exists? }

end
