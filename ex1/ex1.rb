require 'bundler/setup'
require 'sinatra'
require 'coffee-script'
require 'yajl/json_gem'

get '/' do
  haml :index, locals: { rates: Rates.all }
end

get '/rates' do
  [ 200, Rates.all.to_json ]
end

# Supposing you have the coffee command available at your backend
get '/application.js' do
  coffee :application
end

class Rates
  def self.all
      [
        { id: 1,
          currency_name: "AED",
          rate: 3.6731 },
        { id: 2,
          currency_name: "AED",
          rate: 3.6731 },
      ]
  end
end
