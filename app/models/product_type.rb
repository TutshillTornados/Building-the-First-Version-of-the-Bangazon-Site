class ProductType < ApplicationRecord
    # Makes sure product type has the one bit of info it needs, a name.
    has_many :products
    validates_presence_of :product_type_name
end
