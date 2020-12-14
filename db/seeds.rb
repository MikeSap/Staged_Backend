# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m = User.create(email: "mike@mike.com", username: "MikeSap", city:"Chicago", password:"123", password_confirmation:"123")
d = User.create(email: "dre@dre.com", username: "DreSoule", city:"Chicago", password:"123", password_confirmation:"123")
c = User.create(email: "conrad@conrad.com", username: "ConradNav", city:"Chicago", password:"123", password_confirmation:"123")
j = User.create(email: "jeff@jeff.com", username: "JeffBol", city:"Chicago", password:"123", password_confirmation:"123")

sb =Band.create(name:"Shitty Beatles", city:"Chicago", url:"www.bandcamp.com/shitty_beatles", bio:"The Shitty Beatles really aren't that great")
sz =Band.create(name:"Shitty Zep", city:"Chicago", url:"www.bandcamp.com/shitty_zep", bio:"Shitty Zep really aren't that great")
ss =Band.create(name:"Shitty Stones", city:"Chicago", url:"www.bandcamp.com/shitty_stones", bio:"Shitty Stones really aren't that great")
sh =Band.create(name:"Shitty Hendrix", city:"Chicago", url:"www.bandcamp.com/shitty_hendrix", bio:"Shitty Hendrix really isn't that great")

BandMember.create(band: sb, user: m)
BandMember.create(band: sb, user: d)
BandMember.create(band: sz, user: c)
BandMember.create(band: sz, user: j)

Connection.create(follower_id: m.id, followed_id: sz.id)
Connection.create(follower_id: d.id, followed_id: sz.id)
Connection.create(follower_id: c.id, followed_id: sb.id)
Connection.create(follower_id: j.id, followed_id: sb.id)


album = Event.create(name:"The off-white album", date: "2021-01-02 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
album = Event.create(name:"The off-white album2", date: "2021-01-03 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
album = Event.create(name:"The off-white album3", date: "2021-01-04 06:01", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
album = Event.create(name:"The off-white album4", date: "2021-01-05 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
album = Event.create(name:"Paint it white", date: "2021-01-06 06:00", url: "www.bandcamp.com/shitty_stones/paintitwhite", event_type: "Music", band: ss)
album = Event.create(name:"Blue Haze", date: "2021-01-05 06:00", url: "www.bandcamp.com/shitty_hendrix/bluehaze", event_type: "Music", band: sh)
album = Event.create(name:"Blue Haze222", date: "2021-01-05 00:00", url: "www.bandcamp.com/shitty_hendrix/bluehaze", event_type: "Music", band: sb)

Comment.create(user:m, event: album, content: "This album aiiiight" )

