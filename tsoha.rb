require 'rubygems'
require 'sinatra'
require 'erb'

require 'config/init'
require 'models/user'
require 'models/tables'

DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.setup(:default, "sqlite3::")

class Tsoha < Sinatra::Base

  enable :sessions
  set :public, File.dirname(__FILE__) + "/public"

  

  get '/' do

#    @esimerkkimuuttuja = "tämä on muuttuja"
#    @sessiosta_muuttujaan = session[:muuttuja]
#    @testmodelin_arvot = User.all
    erb :index
  end

  get '/add' do
    erb :add
  end
  post '/add/addcd' do
    compactdisc = CompactDisc.new(params)
    if compactdisc.save
      redirect '/added'
    else
      erb :error
  end

  end
  post '/search' do
    @text = "Hakutulokset:"

    erb :search
  end
  get '/error' do
    erb :error
  end
  get '/added' do
    erb :added
  end
  get '/login' do
    erb :login
  end
  get '/sessioon/:arvo' do
    session[:muuttuja] = params[:arvo]
    redirect '/'
  end
  post '/list' do
    erb :listed
  end

  end
