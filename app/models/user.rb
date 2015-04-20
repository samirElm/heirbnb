class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :email,     presence: true, uniqueness: true
end
