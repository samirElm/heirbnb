class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: "150x150>", thumb: "80x80>" }

  validates_attachment_content_type :avatar,
    content_type: /\Aimage\/.*\z/

  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :email,     presence: true, uniqueness: true
end
