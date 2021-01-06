m = User.create(email: "mike@mike.com", username: "MikeSap", city:"Chicago", password:"123", password_confirmation:"123")
d = User.create(email: "dre@dre.com", username: "DreSou", city:"Chicago", password:"123", password_confirmation:"123")
c = User.create(email: "conrad@conrad.com", username: "ConradNav", city:Faker::Address.city, password:"123", password_confirmation:"123")
j = User.create(email: "jeff@jeff.com", username: "JeffBol", city:Faker::Address.city, password:"123", password_confirmation:"123")
w = User.create(email: "willd@willd.com", username: "WillDui", city:Faker::Address.city, password:"123", password_confirmation:"123")
t = User.create(email: "tomb@tomb.com", username: "TomBig", city:Faker::Address.city, password:"123", password_confirmation:"123")
l = User.create(email: "lauren@lauren.com", username: "LaurenCun", city:Faker::Address.city, password:"123", password_confirmation:"123")
h = User.create(email: "hector@hector.com", username: "HectorAlv", city:Faker::Address.city, password:"123", password_confirmation:"123")
j = User.create(email: "john@john.com", username: "JohnLov", city:Faker::Address.city, password:"123", password_confirmation:"123")
b = User.create(email: "barbara@barbara.com", username: "BarbaraKou", city:Faker::Address.city, password:"123", password_confirmation:"123")
jw = User.create(email: "justin@justin.com", username: "JustinWebb", city:Faker::Address.city, password:"123", password_confirmation:"123")
js = User.create(email: "josh@josh.com", username: "JoshSing", city:Faker::Address.city, password:"123", password_confirmation:"123")
my = User.create(email: "muhammet@muhammet.com", username: "MuhammetYil", city:Faker::Address.city, password:"123", password_confirmation:"123")
z = User.create(email: "zach@zach.com", username: "ZachCar", city:Faker::Address.city, password:"123", password_confirmation:"123")
wv = User.create(email: "willv@willv.com", username: "WillVet", city:Faker::Address.city, password:"123", password_confirmation:"123")
jv = User.create(email: "josue@josue.com", username: "JosueVir", city:Faker::Address.city, password:"123", password_confirmation:"123")
to = User.create(email: "tomo@tomo.com", username: "TomOday", city:Faker::Address.city, password:"123", password_confirmation:"123")


users = [m,d,c,j,w,t,l,h,j,b,jw,js,my,z,wv,jv,to]

75.times do
    num= rand(1..23)
    band = Faker::Music.band
    city = Faker::Team.state
    url = "www.bandcamp.com/#{CGI.escape(band)}"
    bio = "#{band} is #{Faker::Hipster.sentence}"

    band = Band.new(name: band, city: city, url:url, bio: bio)
    band.photo.attach(io:File.open("app/assets/band_photos/bh#{num}.jpg"), filename: "bh#{num}.jpg", content_type: "image/jpg")
    band.save

end

bands = Band.all

150.times do

  BandMember.create(band: bands.sample, user: users.sample)

end

# BandMember.create(band: bands.sample, user: m)
# BandMember.create(band: bands.sample, user: m)
# BandMember.create(band: bands.sample, user: d)
# BandMember.create(band: bands.sample, user: d)
# BandMember.create(band: bands.sample, user: c)
# BandMember.create(band: bands.sample, user: c)
# BandMember.create(band: bands.sample, user: j)
# BandMember.create(band: bands.sample, user: j)
# BandMember.create(band: bands.sample, user: t)
# BandMember.create(band: bands.sample, user: w)


300.times do
    Connection.create(follower_id: users.sample.id, followed_id: bands.sample.id)
end

event_types = ["Music", "Show","Merch"]
t1 = Time.parse("2020-12-01 00:00:00")
t2 = Time.parse("2021-4-30 23:59:59")

300.times do
    time = rand(t1..t2)
    album = Faker::Music.album
    eband= bands.sample
    num= rand(1..25)
    event = Event.new(name: album, date: time, url: "http://www.bandcamp.com/#{CGI.escape(album)}", event_type:"Music", band: eband, location: eband.city)
    event.photo.attach(io:File.open("app/assets/album_art/aa#{num}.jpg"), filename: "aa#{num}.jpg", content_type: "image/jpg")
    event.save
end

300.times do
    time = rand(t1..t2)
    showName = Faker::Music.album
    eband= bands.sample
    num= rand(1..25)
    event = Event.new(name: showName, date: time, url: "http://www.bandcamp.com/#{CGI.escape(showName)}", event_type:"Show", band: eband, location: Faker::University.name)
    event.photo.attach(io:File.open("app/assets/album_art/aa#{num}.jpg"), filename: "aa#{num}.jpg", content_type: "image/jpg")
    event.save
end

300.times do
    time = rand(t1..t2)
    merchName = Faker::Commerce.product_name
    eband= bands.sample
    num= rand(1..25)
    event = Event.new(name: merchName, date: time, url: "http://www.bandcamp.com/#{CGI.escape(merchName)}", event_type:"Merch", band: eband, location: eband.city)
    event.photo.attach(io:File.open("app/assets/merch_photos/mp#{num}.jpg"), filename: "mp#{num}.jpg", content_type: "image/jpg")
    event.save
end

events = Event.all

2000.times do
    Comment.create(user:users.sample, event: events.sample, content: Faker::Hipster.sentence )
end
