require "http"
require "json"

GMAPS_KEY = "AIzaSyDKz4Y3bvrTsWpPRNn9ab55OkmcwZxLOHI"
PIRATE_WEATHER_KEY = "3RrQrvLmiUayQ84JSxL8D2aXw99yRKlx1N4qFDUE"

puts "Hello, where are you currently?"
user_location = gets.chomp

puts "Getting weather from #{user_location}"

gmaps_key = ENV.fetch("GMAPS_KEY")
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

maps_data = HTTP.get(gmaps_url)
parsed_gmaps_data = JSON.parse(maps_data)
results_array = parsed_gmaps_data.fetch("results")

user_lat = results_array[0].fetch("geometry").fetch("location").fetch("lat")
user_lng = results_array[0].fetch("geometry").fetch("location").fetch("lng")

pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")

pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{user_lat},#{user_lng}"
