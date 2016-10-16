require 'dm-core'
require 'dm-serializer/to_json'
require 'dm-redis-adapter'

DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, adapter: "redis"

class Question
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :comments
end

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :text, String

  belongs_to :question
end

DataMapper.finalize
