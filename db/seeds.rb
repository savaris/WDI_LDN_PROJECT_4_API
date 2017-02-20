# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, Game].each(&:destroy_all)

u1 = User.create!(username: 'Hudhayfa', email: 'hudhayfa@hudhayfa.com', password:'password', password_confirmation: 'password')

g1 = Game.create!(title: "The Witcher 3: Wild Hunt", description: "The Witcher: Wild Hunt is a story-driven, next-generation open world role-playing game set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher you play as the professional monster hunter, Geralt of Rivia, tasked with finding a child of prophecy in a vast open world rich with merchant cities, viking pirate islands, dangerous mountain passes, and forgotten caverns to explore.", critic_rating: 91.58, time_to_beat: 258420, pegi_rating: 5, cover_img: "//images.igdb.com/igdb/image/upload/t_thumb/tri1c6vbydeosoqajwt1.png", video_url: "5nLipy-Z4yo", category: "RPG", user_id: 1, screenshots:["//images.igdb.com/igdb/image/upload/t_thumb/z5t0yuhyiiui1ickwhgj.png", "//images.igdb.com/igdb/image/upload/t_thumb/farvemmmxav0bgt6wx7t.png"], status_flag: 'played')
