class Customer < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email
    has_many :pay_methods

    validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip, :phone_number 
end
