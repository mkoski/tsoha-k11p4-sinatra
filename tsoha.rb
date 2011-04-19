require 'rubygems'
require 'sinatra'
require 'erb'

require 'config/init'
require 'models/user'
require 'models/tables'
require 'models/CompactDisc'

class Tsoha < Sinatra::Base
  enable :sessions
  set :public, File.dirname(__FILE__) + "/public"

# Navigations

  get '/' do
    if session['id'] == nil
    redirect :login
    else     
      @user = User.get(session['id'])
      @logged_in = @user.username
      @login_msg ="You are logged in as #{@logged_in}!"
    end   
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/search' do
    erb :search
  end

  get '/add' do
    if session['id'] == nil
      @login_msg = "You must be logged in to do that."
      erb :login
    else
      erb :add
    end
  end

  get '/error' do
    erb :error
  end

  get '/added' do
    erb :added
  end

  get '/register' do
    erb :register
  end

  # Actions

  post '/login' do
    @user = User.first(:username => params[:username], :password => params[:password])
    if @user != nil
      session['id'] = @user.id    
      redirect '/'
    else
      @login_msg = "Invalid username or password"
      erb :login
    end   
  end

  post '/logout' do
    session['id'] = nil
    @login_msg = "You logged out."
    redirect '/login'
  end

  post '/register' do
      if params[:username] and params[:password]        
          @user = User.create(:username => params[:username], :password => params[:password])
          @login_msg = "Registration ok!"
          erb :login
      else
        @err_messages = "Check username/password."
        erb :error
      end
  end

  post '/add' do
    compactdisc = CompactDisc.new(params)
    if compactdisc.save
      redirect '/added'
    else
        @err_messages = compactdisc.errors
      erb :error
    end
  end

  post '/search' do
    @search_results =CompactDisc.search( params[:title],params[:artist])
    if  @search_results == nil
      @search_results = CompactDisc.all
    end
    erb :results
  end

end
