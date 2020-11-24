require 'sinatra/base'

class BnB < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  run! if app_file == $0

end
