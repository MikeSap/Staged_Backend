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

users = [m,d,c,j]

25.times do

    band = Faker::Music.band
    city = "Chicago"
    url = "www.bandcamp.com/#{band}"
    bio = "#{band} is aight"

    Band.create(name: band, city: city, url:url, bio: bio)

end

# sz =Band.create(name:Faker::Music.band, city:"Chicago", url:"www.bandcamp.com/shitty_zep", bio:"Shitty Zep really aren't that great")
# ss =Band.create(name:Faker::Music.band, city:"Chicago", url:"www.bandcamp.com/shitty_stones", bio:"Shitty Stones really aren't that great")
# sh =Band.create(name:Faker::Music.band, city:"Chicago", url:"www.bandcamp.com/shitty_hendrix", bio:"Shitty Hendrix really isn't that great")

bands = Band.all


BandMember.create(band: bands.sample, user: m)
BandMember.create(band: bands.sample, user: d)
BandMember.create(band: bands.sample, user: c)
BandMember.create(band: bands.sample, user: j)


20.times do
    Connection.create(follower_id: users.sample.id, followed_id: bands.sample.id)
end
# Connection.create(follower_id: m.id, followed_id: sz.id)
# Connection.create(follower_id: d.id, followed_id: sz.id)
# Connection.create(follower_id: c.id, followed_id: sb.id)
# Connection.create(follower_id: j.id, followed_id: sb.id)

event_types = ["Music", "Show","Merch"]
t1 = Time.parse("2020-11-01 00:00:00")
t2 = Time.parse("2021-1-31 23:59:59")

50.times do
    time = rand(t1..t2)
    album = Faker::Music.album
    Event.create(name: album, date: time, url: "www.bandcamp.com/#{album}", event_type:event_types.sample, band: bands.sample)
end
# album = Event.create(name:"The off-white album", date: "2021-01-02 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
# album = Event.create(name:"The off-white album2", date: "2021-01-03 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
# album = Event.create(name:"The off-white album3", date: "2021-01-04 06:01", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
# album = Event.create(name:"The off-white album4", date: "2021-01-05 00:00", url: "www.bandcamp.com/shitty_beatles/offwhite", event_type: "Music", band: sb)
# album = Event.create(name:"Paint it white", date: "2021-01-06 06:00", url: "www.bandcamp.com/shitty_stones/paintitwhite", event_type: "Music", band: ss)
# album = Event.create(name:"Blue Haze", date: "2021-01-05 06:00", url: "www.bandcamp.com/shitty_hendrix/bluehaze", event_type: "Music", band: sh)
# album = Event.create(name:"Blue Haze222", date: "2021-01-05 00:00", url: "www.bandcamp.com/shitty_hendrix/bluehaze", event_type: "Music", band: sb)

events = Event.all

100.times do
    Comment.create(user:users.sample, event: events.sample, content: Faker::Hipster.sentence )
end
