require 'net/http'
require 'json'
require 'uri'

def findLocation(location)
    params = {:query => location}
    uri = URI("https://www.metaweather.com/api/location/search/")
    uri.query = URI.encode_www_form(params)
    json = Net::HTTP.get(uri)
    res = JSON.parse(json)

    return res[0]['woeid']
end

def findWeather(id)
    uri = URI("https://www.metaweather.com/api/location/#{id}/")
    json = Net::HTTP.get(uri)
    res = JSON.parse(json)
    return res
end



puts 'enter location name'
location = gets.chomp

id = findLocation(location)

res = findWeather(id)

state    = res['consolidated_weather'][0]['weather_state_name']
min_t    = res['consolidated_weather'][0]['min_temp']
max_t    = res['consolidated_weather'][0]['max_temp']
humidity = res['consolidated_weather'][0]['humidity']

puts "#{location}'s state: #{state} minimum temp: #{min_t}, maximum temp: #{max_t}, humidity: #{humidity}"


