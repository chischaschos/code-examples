require 'tempfile'
require 'open-uri'

file = Tempfile.new('foo')
puts file.inspect


data = open file

puts data.read
