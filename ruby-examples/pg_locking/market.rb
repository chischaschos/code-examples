Bundler.setup
require 'pg'

class Lock
  def acquire
    @conn = PG.connect(dbname: 'lockingv1_example')
    lock = @conn.exec('SELECT pg_try_advisory_lock(123)')
    @is_locked = [true, "t"].include?(lock[0]["pg_try_advisory_lock"])
  end

  def release
    @conn.exec('select pg_advisory_unlock(123)') if @is_locked
    @conn.finish
  end
end

class People
  attr_reader :name, :thread

  def initialize(name:, token:)
    @name = name
    puts "New people #{name}"
  end

  def try
    lock = Lock.new

    @thread = Thread.new do
      if lock.acquire
        puts "#{name} got the token"
        sleep(2)
      end

      lock.release
    end

    self
  end

  def join
    thread.join
  end
end

class Token
  attr_accessor :lock

  def initialize
    @lock = Lock.new
    puts 'New token'
  end

  def acquire
    lock.acquire
  end

  def release
    lock.release
  end
end

segment = ARGV.shift.to_i

token = Token.new
people = (segment..segment + 10).map { |i| People.new(name: i, token: token).try }

fight_num = 1
puts '--> fight'
people.map { |p| p.join }

loop do
  fight_num += 1
  puts "--> fight #{fight_num}"
  people.map { |p| p.try }
  people.map { |p| p.join }
end
