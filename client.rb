require 'bundler/setup'
require 'colorize'
require 'httparty'
require 'json'

# maybe: Argument-based option parsing

def print_response_details(response)
  puts(
    response.body, response.code,
    response.message, response.headers.inspect
  )
end

post_uri = 'http://localhost:8080/albums'

puts "[POST] #{post_uri}".yellow
post_response = HTTParty.post(
  post_uri,
  body: { name: 'Hello World' }.to_json,
  headers: {
    'Content-type' => 'application/json'
  }
)

print_response_details(post_response)

puts '[POST] Response Location Header is:'.green
puts post_response.headers['location']

puts "[GET] to response: (#{post_response.headers['location']})".green
second_response = HTTParty.get(
  post_response.headers['location'],
  headers: { 'Content-type' => 'application/json' }
)

print_response_details(second_response)

puts "[PUT] to the album: #{post_response.headers['location']}".yellow
patch_response = HTTParty.put(
  post_response.headers['location'],
  body: { name: 'Izel' }.to_json,
  headers: {
    'Content-type' => 'application/json'
  }
)

print_response_details(patch_response)

puts "[DELETE] to the album: #{post_response.header['location']}".yellow
delete_response = HTTParty.delete(
  post_response.headers['location'],
  headers: {
    'Content-type' => 'application/json'
  }
)

print_response_details(delete_response)

puts "[GET] the resouce shouldn't find the resource:".green
puts "This will return html!! see resources/album.rb#17".yellow
another_response = HTTParty.get(
  post_response.headers['location'],
  headers: { 'Content-type' => 'application/json' }
)

print_response_details(another_response)

puts "[POST] #{post_uri}".yellow
post_response = HTTParty.post(
  post_uri,
  body: { name: 'Hello World' }.to_json,
  headers: {
    'Content-type' => 'application/json'
  }
)

print_response_details(post_response)

puts "[POST] #{post_uri}".yellow
post_response = HTTParty.post(
  post_uri,
  body: { name: 'Hello World' }.to_json,
  headers: {
    'Content-type' => 'application/json'
  }
)

print_response_details(post_response)

puts '[GET] ALL RESOURCES: http://localhost:8080/albums'.green
all_resources_response = HTTParty.get(
  'http://localhost:8080/albums',
  headers: { 'Content-type' => 'application/json' }
)

print_response_details(all_resources_response)
