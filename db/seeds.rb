Review.destroy_all
Booking.destroy_all
Appliance.destroy_all
Renter.destroy_all
Owner.destroy_all



15.times do
    Owner.create! ({
        username: Faker::Twitter.screen_name,
        email_address: Faker::Internet.email,
        city: "Seattle",
        address: Faker::Address.street_address,
        password: "123456",
        password_confirmation: "123456" 
    })
end

50.times do
    Renter.create! ({
        username: Faker::Twitter.screen_name,
        email_address: Faker::Internet.email,
        city: "Seattle",
        address: Faker::Address.street_address,
        password: "123456",
        password_confirmation: "123456" 
    })
end

50.times do
    Appliance.create! ({
        owner_id: Owner.all.sample.id,
        appliance_name: Faker::Commerce.product_name,
        appliance_category: Faker::Commerce.department,
        daily_rate: Faker::Commerce.price,
        availability: Faker::Boolean.boolean
    })
end

100.times do
    Booking.create! ({
        renter_id: Renter.all.sample.id,
        appliance_id: Appliance.all.sample.id
    })
end

50.times do
  Review.create! ({
    booking_id: Booking.all.sample.id,
    rating: rand(1..5),
    text_review: Faker::Hipster.paragraph
  })
  end