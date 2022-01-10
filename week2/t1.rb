require 'net/http'


codes = Hash{ "sn" => "Snow",
        "sl" => "Sleet",
        "h" => "Hail",
        "t" => "Thunderstorm",
        "hr" => "Heavy_Rain",
        "lr" => "Light_Rain",
        "s" => "Showers",
        "hc" => "Heavy_Cloud",
        "lc" => "Light_Cloud",
        "c" => "Clear",
    }

def findLocation(name)
    url = URI.parse('https://www.metaweather.com/api/location/search/?query=#{name}')
    req = Net::HTTP.get(url)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body