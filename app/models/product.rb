class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    belongs_to :image, :foreign_key => 'image_id'

    # add :product_type to validates_presence_of >
    validates_presence_of :product_name, :product_price, :product_desc, :quantity, :local_delivery

    validates :product_price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }

    validates :check_bad_words
    

    #validates curse words
    #validates $10,000 or less

    #validates image type and size of image 
    has_attached_file :product, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/default.jpg"
    validates_attachment_content_type :product, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates_with AttachmentSizeValidator, attributes: :product, less_than: 5.megabytes
 
    
end
