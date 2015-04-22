class FlatImage < ActiveRecord::Base
  belongs_to :flat

  has_attached_file :picture,
    styles: { small: "140x100>", medium: "380x200>", large: "1200x600>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
