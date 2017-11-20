class PayMethod < ApplicationRecord
    # belongs_to :customer, foreign_key: "customers"
    validates :account_number, presence: true,
                                length: { minimum: 16 }
    # validates_presence_of :customer_id 
    validates :expiration_date, presence: true
    # , :expiration_date > DateTime.now => true
end
