class Appliance < ApplicationRecord
    belongs_to :owner
    has_many :bookings
    has_many :users, through: :bookings
    has_many :reviews, through: :bookings
    has_one_attached :avatar


    def self.search(search)
        if search != nil
          name = Appliance.find_by(appliance_name: search)
          if name
            self.where(appliance_name: name.appliance_name)
        else
          Appliance.all
        end
        else
            Appliance.all
        end 
      end

      def rented_out
        # @appliance.find_by()
        if self.bookings
          self.update(availability: false)
        else
          self.update(availability: true)
        end
    end

    def returned
      if self.bookings
        self.update(availability: true)
      else
        self.update(availability: false)
      end
    end
      
end
