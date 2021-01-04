m = User.create(email: "mike@mike.com", username: "MikeSap", city:"Chicago", password:"123", password_confirmation:"123")
d = User.create(email: "dre@dre.com", username: "DreSou", city:"Chicago", password:"123", password_confirmation:"123")
c = User.create(email: "conrad@conrad.com", username: "ConradNav", city:Faker::Address.city, password:"123", password_confirmation:"123")
j = User.create(email: "jeff@jeff.com", username: "JeffBol", city:Faker::Address.city, password:"123", password_confirmation:"123")
w = User.create(email: "will@will.com", username: "WillAve", city:Faker::Address.city, password:"123", password_confirmation:"123")
t = User.create(email: "tom@tom.com", username: "TomBig", city:Faker::Address.city, password:"123", password_confirmation:"123")

users = [m,d,c,j,w,t]

75.times do

    band = Faker::Music.band
    city = Faker::Address.city
    url = "www.bandcamp.com/#{CGI.escape(band)}"
    bio = "#{band} is #{Faker::Hipster.sentence}"

    band = Band.new(name: band, city: city, url:url, bio: bio)
    band.photo.attach(io:File.open("app/assets/logo/staged_logo.png"), filename: "staged_logo.png", content_type: "image/png")
    band.save

end

bands = Band.all

BandMember.create(band: bands.sample, user: m)
BandMember.create(band: bands.sample, user: m)
BandMember.create(band: bands.sample, user: m)
BandMember.create(band: bands.sample, user: d)
BandMember.create(band: bands.sample, user: d)
BandMember.create(band: bands.sample, user: c)
BandMember.create(band: bands.sample, user: c)
BandMember.create(band: bands.sample, user: j)
BandMember.create(band: bands.sample, user: j)
BandMember.create(band: bands.sample, user: t)
BandMember.create(band: bands.sample, user: w)


300.times do
    Connection.create(follower_id: users.sample.id, followed_id: bands.sample.id)
end

event_types = ["Music", "Show","Merch"]
t1 = Time.parse("2020-12-01 00:00:00")
t2 = Time.parse("2021-3-31 23:59:59")

350.times do
    time = rand(t1..t2)
    album = Faker::Music.album
    eband= bands.sample
    event = Event.new(name: album, date: time, url: "http://www.bandcamp.com/#{album}", event_type:event_types.sample, band: eband, location: eband.city)
    event.photo.attach(io:File.open("app/assets/logo/navLogo.png"), filename: "navLogo.png", content_type: "image/png")
    event.save

end

events = Event.all

500.times do
    Comment.create(user:users.sample, event: events.sample, content: Faker::Hipster.sentence )
end
