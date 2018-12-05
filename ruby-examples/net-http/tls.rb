require 'net/http'
require 'openssl'

ctx = OpenSSL::SSL::SSLContext.new
ctx.ssl_version = :TLSv1_2

http = Net::HTTP.new('www.google.com', '443')
http.use_ssl = true
http.set_debug_output($stdout)

request = Net::HTTP::Get.new('/')
response = http.request(request)
puts response.code
