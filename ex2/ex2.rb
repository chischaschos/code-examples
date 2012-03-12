require 'bundler/setup'
require 'sinatra'
require 'json'
require 'coffee-script'

$:.unshift File.dirname(__FILE__)
require 'lib/models'

get '/' do
  haml :index, locals: { questions: Question.all }
end

get '/questions/:id' do |id|
  Question.get(id).to_json
end

get '/questions/:id/comments' do |id|
  Question.get(id).comments.to_json
end

delete '/questions/:id' do |id|

end

post '/comments' do

end

get '/application.js' do
  coffee :application
end
