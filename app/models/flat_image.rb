class FlatImage < ActiveRecord::Base
  belongs_to :flat

  has_attached_file :picture,
    styles: { medium: "140x100>", large: "1200x600>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
