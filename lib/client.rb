require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://localhost:3000/api/v1/users")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
request["Content-Type"] = "application/json"
request["Accept"] = "application/json"
response = http.request(request)
if response.code == "200"
  data = JSON.parse(response.body)
  puts data
else
  puts response.code + ":"+response.body
end

uri = URI.parse("http://localhost:3000/api/v1/users/create")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.path, {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
})
# Prepare params
request.body = { 
  user: {
  email: 'hookla3@gmail.com',
  password: 'Passw0rd4',
  username: 'hokla_95'
  }
}.to_json

response = http.request(request)

if response.code == "200"
  data = JSON.parse(response.body)
  puts data
else
  puts response.code + ":"+response.body
end


uri = URI.parse("http://localhost:3000/api/v1/users/log_in")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.path, {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
})
# Prepare params
request.body = { 
  user: {
  email: 'wmshafeei@gmail.com',
  password: 'Passw0rd'
  }
}.to_json

response = http.request(request)

if response.code == "200"
  data = JSON.parse(response.body)
  puts data
else
  puts response.code + ":"+response.body
end

uri = URI.parse("http://localhost:3000/api/v1/users/update_data")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Put.new(uri.path, {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
})
# Prepare params
request.body = { 
  user: {
  email: 'hookla3@gmail.com',
  password: 'password_here'
  }
}.to_json

response = http.request(request)

if response.code == "200"
  data = JSON.parse(response.body)
  puts data
else
  puts response.code + ":"+response.body
end