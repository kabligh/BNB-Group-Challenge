require 'sinatra/base'
require './lib/user'
require './database_connection_setup'

class BnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"user/new"
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect ‘/spaces’
    else
      flash[:notice] = "Email is taken. Please try another"
      redirect '/'
    end
  end

  get '/spaces' do
    'Choose a b&b!'
  end

  run! if app_file == $0
end
