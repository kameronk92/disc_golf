# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

innova = Manufacturer.create(name: "Innova", is_american: true, num_pros: 15)
discraft = Manufacturer.create(name: "Discraft", is_american: true, num_pros: 10)
latitude_64 = Manufacturer.create(name: "Latitude 64", is_american: false, num_pros: 17)

river = Disc.create(mold_name: "River", overstable: false, speed: 7, manufacturer_id: 3)
destroyer = Disc.create(manufacturer_id:1, mold_name:"Destroyer", overstable:true, speed:12)
