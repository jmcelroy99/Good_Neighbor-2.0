class Renter < ApplicationRecord
    has_secure_password
    has_many :bookings
    has_many :appliances, through: :bookings

    validates :username, uniqueness: true
    validates :username, length: { in: 6.. 20 }
    
    validates :password, length: { in: 4..20 }

    

end
