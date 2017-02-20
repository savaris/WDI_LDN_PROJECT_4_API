# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "net/http"
require "uri"

[User, Game].each(&:destroy_all)

u1 = User.create!(username: 'Hudhayfa', email: 'hudhayfa@hudhayfa.com', password:'password', password_confirmation: 'password')

uri = URI("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?search=witcher&fields=*")
http = Net::HTTP.new(uri.host, uri.port)
headers = {
    'X-Mashape-Key' => "5N1IqU0Ln5msh2kJB8FNMmu9Ahdrp1BpIWkjsntkQAspOznbn1"
}
path = uri.path.empty? ? "/" : uri.path

#test to ensure that the request will be valid - first get the head
code = http.head(path, headers).code.to_i
if (code >= 200 && code < 300) then

    #the data is available...
    http.get(uri.path, headers) do |chunk|
        #provided the data is good, print it...
        p chunk
    end
end

# uri = URI.parse("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?search=witcher&fields=*")
# http = Net::HTTP.new(uri.host, uri.port).start
# request = Net::HTTP::Get.new(uri.request_uri)
# request.add_field("X-Mashape-Key", "5N1IqU0Ln5msh2kJB8FNMmu9Ahdrp1BpIWkjsntkQAspOznbn1")
# request.add_field("Content-Type", "application/json")
# response = http.request(request)


      # url = URI.parse("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?search=witcher&fields=*")
      # req = Net::HTTP::Get.new(url.path)
      # req["X-Mashape-Key"] = "5N1IqU0Ln5msh2kJB8FNMmu9Ahdrp1BpIWkjsntkQAspOznbn1"
      # res = Net::HTTP.new(url.host, url.port).start do |http|
      #   http.request(req)
      # end
      # p res.body
