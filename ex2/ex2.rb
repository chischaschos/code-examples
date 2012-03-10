require 'bundler/setup'
require 'sinatra'
require 'json'
require 'coffee-script'

get '/' do
  haml :index, locals: { questions: Questions.all }
end

delete '/questions/:id' do |id|

end

post '/comments' do

end

get '/application.js' do
  coffee :application
end


class Questions
  def self.all
    [ { id: 1,
        name: 'Q1',
        description: 'DESC',
        comments: [
          { text: 'BLALBLABLALBLABLAL' },
          { text: 'BLALBLABLALBLABLAL' },
          { text: 'BLALBLABLALBLABLAL' },
          { text: 'BLALBLABLALBLABLAL' }
        ] } ]
  end
end
