require 'sinatra/base'
require './database_connection_setup'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"user/new"
  end

  post '/users' do
    @user = params
    redirect '/'
  end

  run! if app_file == $0
end
