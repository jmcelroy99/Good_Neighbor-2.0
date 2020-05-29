class Review < ApplicationRecord
    belongs_to :booking
    has_many :users, through: :bookings
    has_many :appliances, through: :bookings

    validates :rating, presence: true
    validates :text_review, presence: true
end
