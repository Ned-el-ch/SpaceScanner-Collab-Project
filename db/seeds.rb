Booking.destroy_all
Carrier.destroy_all
Planet.destroy_all
Rocket.destroy_all
Trip.destroy_all
User.destroy_all

12.times do |i|

    User.create(

        email: Faker::Internet.email,
        password: "pass",
        name: Faker::Movies::HarryPotter.character

    )

end

hostility_levels = ["Low", "Medium", "High", "Extreme", "Literally Hell"]

100.times do |i|

    Planet.create(

        name: Faker::TvShows::RickAndMorty.location,
        distance_from_earth: rand(10..10_000),
        gravity: rand(0.1..7.0),
        hostility: hostility_levels.sample,
        population: rand(300_000_000..300_000_000_000),
        breathable_atmosphere: [true, false].sample

    )

end

Planet.where.not(id: Planet.group(:name).select("min(id)")).destroy_all

route_types = ["Long Haul", "Medium Haul", "Short Haul"]

5.times do |i|

    Carrier.create(

        name: Faker::TvShows::SiliconValley.company,
        range: route_types.sample

    )

end

Carrier.where.not(id: Carrier.group(:name).select("min(id)")).destroy_all

10.times do |i|

    Rocket.create(

        name: Faker::Movies::StarWars.vehicle,
        ship_model_name: Faker::Movies::StarWars.droid,
        speed: rand(0.01..100.0),
        passenger_capacity: (rand(4..20) * 10)

    )

end

3000.times do |i|

    Trip.create(

        origin_id: Planet.all.sample.id,
        destination_id: Planet.all.sample.id,
        rocket: Rocket.all.sample,
        carrier: Carrier.all.sample,
        takeoff_time: DateTime.iso8601("#{rand(3008..3016)}-0#{rand(1..9)}-#{rand(10..28)}", Date::ENGLAND)

    )

    puts "Trip ##{i}"

end

User.all.each do |user|

    rand(3..15).times do |i|

        Booking.create(

            user: user,
            trip: Trip.all.sample,
            price: rand(100_000..10_000_000),
            rating: rand(1..10)
        
        )

    end

end