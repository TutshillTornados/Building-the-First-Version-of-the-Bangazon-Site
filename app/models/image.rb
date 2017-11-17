class Image < ApplicationRecord
    has_one :product
     #validates image type and size of image 
     has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/default.jpg"
     # TODO - this needs to be edited to make work.  throwing error
     validates_attachment_content_type :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"] }
     validates_with AttachmentSizeValidator, attributes: :product, less_than: 5.megabytes
end
