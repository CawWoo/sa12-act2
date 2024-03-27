#Use the WorldTimeAPI to display the current date and time for a specified timezone.
require 'net/http'
require 'json'

# Replace {area} and {location} with valid values (e.g., Europe/London)
area = 'Europe'
location = 'London'

# Construct the API URL
url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
response = Net::HTTP.get(URI(url))
data = JSON.parse(response)

# Extract current date and time
current_datetime = data['datetime']
formatted_datetime = current_datetime.split('T').join(' ').split('+').first

# Format the output
puts "The current time in #{area}/#{location} is #{formatted_datetime}"
