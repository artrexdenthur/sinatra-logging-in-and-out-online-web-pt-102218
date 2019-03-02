require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    if User.find_by_username(params[:username])
      session[:user_id] = User.find_by_username(params[:username]).id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    "You've been logged out"
  end


end

