require 'net/http'

http = Net::HTTP.new('localhost', 2000)
http.read_timeout = 3 # This is supposed to raise Net::ReadTimeout

request = Net::HTTP::Get.new('/')

response = http.request(request)

puts response.body
