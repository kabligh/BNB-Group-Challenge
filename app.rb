require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './database_connection_setup'
require './lib/spaces'

class BnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure do
    # allows sinatra to find my CSS stylesheet
    set :public_folder, File.expand_path('../public', __FILE__)
    set :views        , File.expand_path('../views', __FILE__)
    set :root         , File.dirname(__FILE__)
  end

  get '/' do
    erb :"user/new"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = "Email is taken. Please try another."
      redirect '/'
    end
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  post '/spaces' do
    @space = Space.create(name: params[:name],
      user_id: session[:user_id],
      description: params[:description],
      price: params[:price]
    )
    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/list')
  end

  run! if app_file == $0
end
