class AddAttachmentPictureToFlatImages < ActiveRecord::Migration
  def self.up
    change_table :flat_images do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :flat_images, :picture
  end
end
