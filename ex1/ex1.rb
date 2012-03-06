require 'bundler/setup'
require 'sinatra'
require 'coffee-script'

get '/' do
  haml :index
end

# Supposing you have the coffee command available at your backend
get '/application.js' do
  coffee :application
end

