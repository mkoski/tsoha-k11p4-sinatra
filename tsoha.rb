require 'rubygems'
require 'sinatra'
require 'erb'

require 'config/init'

require 'models/user'

class Tsoha < Sinatra::Base

  enable :sessions
  set :public, File.dirname(__FILE__) + "/public"

  get '/' do
    @esimerkkimuuttuja = "tämä on muuttuja"
    @sessiosta_muuttujaan = session[:muuttuja]
    @testmodelin_arvot = User.all
    erb :index
  end

  get '/sessioon/:arvo' do
    session[:muuttuja] = params[:arvo]
    redirect '/'
  end

end
