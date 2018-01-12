require 'unirest'

screen_size = 70

system "clear"

puts
puts "=" * 70
puts "Weather Brought to You by the Best".center(70)
puts "=" * 70
puts 

print " " * 15 + "Enter a city: "
city = gets.chomp

print " " * 15 + "Enter a state:"
state = gets.chomp

puts 
puts
puts ("-" * 60).center(screen_size)

response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

channel = response.body["query"]["results"]["channel"] 

temp_unit = channel["units"]["temperature"]
location_city = channel["location"]["city"]
location_state = channel["location"]["region"]

temperature = channel["item"]["condition]["temp"]
condition = channel["item"]["condition"]["text"]

puts "Today in #{location_city}, #{location_state} it is #{temperature} 