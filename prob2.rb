#Create a Ruby program that fetches the latest cryptocurrency prices and market capitalization from CoinGecko.

require 'net/http'
require 'json'

# Send a GET request to CoinGecko API
url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
response = Net::HTTP.get(URI(url))
data = JSON.parse(response)

# Extract data for the currencies
cryptocurrencies = data.map do |coin|
  {
    name: coin['name'],
    price: coin['current_price'],
    market_cap: coin['market_cap']
  }
end

# Sort by market capitalization in descending order
sorted_cryptocurrencies = cryptocurrencies.sort_by { |coin| -coin[:market_cap] }

# Display the top 5 cryptocurrencies
puts 'Top 5 Cryptocurrencies by Market Capitalization:'
sorted_cryptocurrencies.first(5).each do |coin|
  puts "#{coin[:name]} (Price: $#{coin[:price]}, Market Cap: $#{coin[:market_cap]})"
end
