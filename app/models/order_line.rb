class OrderLine < ApplicationRecord
    belongs_to :order, :foreign_key => 'order_id'
    belongs_to :product, :foreign_key => 'product_id'
end
