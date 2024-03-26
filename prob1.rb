#Fetch and analyze public repository data from the GitHub API for a specific user.

require 'httparty'
require 'json'

username = 'moxie0'

# Send GET request
response = HTTParty.get("https://api.github.com/users/#{username}/repos")
# Parse the JSON response
repos = JSON.parse(response.body)

#Variable tracking
max_stars = 0
most_starred_repo = nil

#Go through the repositories
repos.each do |repo|
  name = repo['name']
  description = repo['description']
  stars = repo['stargazers_count']
  url = repo['html_url']

  # Check for repositories that have more stars than max
  if stars > max_stars
    max_stars = stars
    most_starred_repo = {
      name: name,
      description: description,
      stars: stars,
      url: url
    }
  end
end

#Information
puts "Most Starred Repository:"
puts "Name: #{most_starred_repo[:name]}"
puts "Description: #{most_starred_repo[:description]}"
puts "Stars: #{most_starred_repo[:stars]}"
puts "URL: #{most_starred_repo[:url]}"
