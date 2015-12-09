# your code, here.
require "pry"
require "net/http"
require "json"

url = "http://api.seatgeek.com/2/events?venue.city=Boston&venue.state=MA&datetime_local.gte=2015-12-09&datetime_local.lt=2015-12-10"
uri = URI(url)
response = Net::HTTP.get_response(uri)
events = JSON.parse(response.body)["events"]
events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
