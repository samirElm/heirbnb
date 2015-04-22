class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, :omniauth_providers => [ :facebook ]


  has_many :flats,    dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_attached_file :picture,
    styles: {large: "200x200>", medium: "150x150>", thumb: "80x80>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :email,     presence: true, uniqueness: true

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end
end

# user.remote_avatar_url = auth.info.image.gsub('http://','https://')
