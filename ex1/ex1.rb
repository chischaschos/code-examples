require 'bundler/setup'
require 'sinatra'
require 'coffee-script'
require 'yajl/json_gem'

get '/' do
  haml :index, locals: { rates: Rates.all }
end

# Supposing you have the coffee command available at your backend
get '/application.js' do
  coffee :application
end

class Rates
  def self.all
      [
        { currency_name: "AED",
          rate: 3.6731 },
        { currency_name: "AED",
          rate: 3.6731 },
      ]
  end
end
