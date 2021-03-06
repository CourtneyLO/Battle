require 'sinatra/base'



class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    redirect '/play'
  end

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    erb(:play)
  end

  post '/attack' do
    @player2 = session[:player2]
    erb(:attack)
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
