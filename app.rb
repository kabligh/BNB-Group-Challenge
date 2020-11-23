require 'sinatra/base'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :"user/new"
  end

  post '/users' do

  end

  run! if app_file == $0

end
