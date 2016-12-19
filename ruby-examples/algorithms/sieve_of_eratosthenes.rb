module Sieve
  module_function

  def first(size)
    s = Array.new(size) { true }
    s[0] = s[1] =  false # first two are not primes

    for i in 2..Math.sqrt(size)
      next unless s[i]   # skip marked ones

      v = 0
      j = i ** 2 + i * v

      loop do
        j = i ** 2 + i * v
        v += 1

        break if j > size

        s[j] = false
      end
    end

    primes = []

    s.each_with_index do |v, i|
      primes << i if s[i]
    end

    primes
  end

  def prime?(n)
    first(n).include?(n)
  end
end
