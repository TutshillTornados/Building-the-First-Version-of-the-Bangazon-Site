class Image < ApplicationRecord
    attr_accessor :image 
    belongs_to :imageable, polymorphic: true, optional: true
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/default.jpg"
    validates_attachment_content_type :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"] }
      
    # belongs_to :product
    #  #validates image type and size of image 
    # #  validates :image, dimensions: { width: 250, height: 100 }
    #  # TODO - this needs to be edited to make work.  throwing error
    #  validates_with AttachmentSizeValidator, attributes: :product, less_than: 5.megabytes
end
