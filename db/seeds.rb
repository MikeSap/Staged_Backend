# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m = User.create(email: "aquaponicsveggies@gmail.com", username: "MikeSap", city:"Chicago", password:"123", password_confirmation:"123")
d = User.create(email: "justsaymikesays@gmail.com", username: "DreSoule", city:"Chicago", password:"123", password_confirmation:"123")

sb =Band.create(name:"Shitty Beatles", city:"Chicago", url:"www.bandcamp.com/shitty_beatles", bio:"The Shitty Beatles really aren't that great")

BandMember.create(band: sb, user: m)
BandMember.create(band: sb, user: d)



