class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    # belongs_to :image, :foreign_key => 'image_id'

    validates_presence_of :product_name, :product_price, :product_desc, :quantity, :product_added, :product_type_id
    validates :local_delivery, inclusion: { in: [true, false]}

    #validates curse words
    #validates $10,000 or less 
    validates :product_price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }
end
