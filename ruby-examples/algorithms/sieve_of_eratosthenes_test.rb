require 'minitest/autorun'
require 'bundler/setup'
Bundler.require

require 'open-uri'
require_relative 'sieve_of_eratosthenes'

class SieveTest < Minitest::Test

  def test_first_5_primes
    primes = Sieve.first(12)

    assert_equal([2, 3, 5, 7, 11], primes)
  end

  def test_is_prime
    [3, 5, 7, 11].each do |p|
      assert(Sieve.prime?(p), "#{p} must be a prime")
    end
  end

  def test_is_not_prime
    [1, 2, 10, 20].each do |p|
      refute(Sieve.prime?(p))
    end
  end

  def test_big_num
    skip
    assert(Sieve.prime?(1000000007))
  end
end
