require 'rubygems'
require 'sinatra'
require 'erb'

require 'config/init'
require 'models/User'
require 'models/CompactDisc'
require 'models/Artist'

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

  get '/bio/:artist' do
    @artist = params[:artist]
    @artist = Artist.all(:name => @artist)
    @artist.each do |a|
      @bio = a.bio
    end
    erb :bio
  end

   # Actions

  post '/delete/:cd' do
    @cd = CompactDisc.get(params[:cd])
    @cd.destroy
    @login_msg = "Cd deleted."
    erb:search
  end

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
      @user = User.new
      @user.username = params[:username]
      @user.password = params[:password]
      if @user.save
        @login_msg = "Registration ok!"
        erb :login
      else
        @err_messages = @user.errors
        erb :error
      end
    end
  end

  post '/add' do
    unless Artist.first(:name => params[:artist])
      @artist = Artist.new
      @artist.name = params[:artist]
      @artist.bio = params[:bio]
      @artist.save
    end       
    @compactdisc = CompactDisc.new
    @compactdisc.title = params[:title]
    @compactdisc.artist = params[:artist]
    @compactdisc.released = params[:released]
    @compactdisc.record_company = params[:record_company]
    @compactdisc.genre = params[:genre]
    @compactdisc.picture = params[:picture]  
    if @compactdisc.save
      redirect '/added'
    else
      @err_messages = @compactdisc.errors
      erb :error
    end
  end

  post '/search' do
    @search_results = CompactDisc.search(params[:title],params[:artist],params[:released],params[:genre])    
    erb :results
  end

end
