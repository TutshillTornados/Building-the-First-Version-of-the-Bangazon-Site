class ProductType < ApplicationRecord
    has_many :products
    validates_presence_of :product_type_name
end
