class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    # belongs_to :image, :foreign_key => 'image_id'
    validates :product_name, :product_price, :product_desc, :quantity
    #validates curse words
    #validates $10,000 or less
    
end
