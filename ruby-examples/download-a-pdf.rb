require 'open-uri'

f = open('https://frenesssi.files.wordpress.com/2009/04/influenza.pdf')

data = f.read
puts data.class
puts data.length

puts IO.write('a.pdf', data)
