class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    # belongs_to :image, :foreign_key => 'image_id'
    # add :product_type to validates >
    validates :product_name, :product_price, :product_desc, :quantity
    #validates curse words
    #validates $10,000 or less
     #validates image type and size of image 
    has_attached_file :product, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/default.jpg"
    validates_attachment_content_type :product, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates_with AttachmentSizeValidator, attributes: :product, less_than: 5.megabytes
 
    
end
