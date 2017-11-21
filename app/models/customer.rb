class Customer < ApplicationRecord
    # Sets customer requirements of email, password, pay methods and orders for use later on and to make sure the info is present when needed
    has_secure_password
    validates_uniqueness_of :email
    has_many :pay_methods
    has_many :orders

    # validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip, :phone_number 
end
