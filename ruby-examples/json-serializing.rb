require 'json'

class A
  attr_accessor :a, :b, :c


  def to_json(*)
    {
      a: a,
      b: b
    }.to_json
  end
end

a = A.new
a.a = 1
a.b = 2

puts a.to_json.inspect
