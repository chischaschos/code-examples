require 'bundler'

Bundler.setup(:default)

require 'omniauth'
require 'omniauth-github'
require 'octokit'
require 'pry'

CLIENT_ID     = 'A_CLIENT_ID'.freeze
CLIENT_SECRET = 'A_CLIENT_SECRET'.freeze

class Authenticator
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    return process_callback(request) if request.path.match(/\/auth\/github\/callback/)

    return @app.call(env) if request.session['session_id'] || request.path == '/auth/github'

    response = Rack::Response.new
    response.redirect('/auth/github')
    return response.finish
  end

  def process_callback(request)
    client = Octokit::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)

    response = client.exchange_code_for_token(request.params["code"])
    client.access_token = response[:access_token]
    org = client.orgs.find {|o| o[:login] == 'myorganization'}

    response = Rack::Response.new

    if org
      response.redirect('/')
    else
      # TODO: cookies cleanup
      response.redirect('/404.html')
    end

    response.finish
  end
end

use Rack::Session::Cookie, key: 'my-cookie-name',
                           secret: 'change_me',
                           old_secret: 'also_change_me'
#                                :domain => 'foo.com',
#                                :path => '/',
#                                :expire_after => 2592000,


use Authenticator

use OmniAuth::Builder do
  provider :github, CLIENT_ID, CLIENT_SECRET, scope: 'read:org'
end

use Rack::Static, :urls => [""], :root => 'public', :index => 'index.html'

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
end

run app
