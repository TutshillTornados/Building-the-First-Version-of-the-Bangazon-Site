class PayMethod < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    validates :account_number, presence: true,
                                length: { minimum: 16 }
    validates :expiration_date, presence: true
    # , :expiration_date > DateTime.now => true
end
