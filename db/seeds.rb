# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "net/http"
require "uri"
require 'unirest'
require 'json'

[User, Game].each(&:destroy_all)

u1 = User.create!(username: 'Phil', email: 'phil@phil.com', password:'password', password_confirmation: 'password', first_name: 'Phil', last_name: 'Murray', profile_img: 'https://fillmurray.com/200/200')

u2 = User.create!(username: 'Johnnie', email: 'johnnie@johnnie.com', password:'password', password_confirmation: 'password', first_name: 'Johnnie', last_name: 'de La Moriniere', profile_img: 'https://pbs.twimg.com/profile_images/780714859700883456/E1vI9fK6_400x400.jpg')


require 'unirest'

looping = true
limit = 50
offset = 0
counter = 0

while looping
  response = Unirest.get "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&limit=#{limit}&offset=#{offset}", headers:{ "Accept" => "application/json", "X-Mashape-Key" =>  "7ncTKW9qAImsh7dL9r3cxpR9RyuKp1a7Pr7jsnw2XimLVmRNYf" }

  response.body.each {|game|
    if (game['name'] && game['summary'] && game['rating'] && game['time_to_beat'] && game['pegi'] && game['cover'] && game['videos'] && game['screenshots'])
      screenshots = []
      platforms = []

      game['screenshots'].each {|screenshot|
        screenshots << ('https:' + screenshot['url'].sub!('/t_thumb', ''))
      }

      game['release_dates'].each {|thing|
        if !platforms.include? thing['platform']
          platforms << thing['platform']
        end
      }

      new_game = {
        title: game['name'],
        description: game['summary'] || 'Not provided.',
        critic_rating: game['rating'] || 'Not provided',
        time_to_beat: game['time_to_beat']['normally'] || 'Not provided.',
        pegi_rating: game['pegi']['rating'] || 'Not provided',
        cover_img: 'https:' + game['cover']['url'].sub!('/t_thumb', '') || 'Not provided.',
        video_url: game['videos'][0]['video_id'] || 'Not provided.',
        screenshots: screenshots,
        release_date: game['first_release_date'],
        genres: game['genres'],
        platforms: platforms
      }
      Game.create!(new_game)
      counter += 1
      puts counter
    end
  }

  offset += limit
  if response.body.length < 50
    looping = false
  end
end
