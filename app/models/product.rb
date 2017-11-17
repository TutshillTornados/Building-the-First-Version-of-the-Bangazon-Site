class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    # belongs_to :product_type, :foreign_key => 'product_type_id'
    # belongs_to :image, :foreign_key => 'image_id'

    # add :product_type to validates_presence_of >
    validates_presence_of :product_name, :product_price, :product_desc, :quantity, :product_added
    validates :local_delivery, inclusion: { in: [true, false]}

    validates :product_price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }

    validates :check_bad_words
    

    #validates curse words
    #validates $10,000 or less 
end
