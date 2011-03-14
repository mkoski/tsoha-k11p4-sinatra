require 'rubygems'
require 'sinatra'
require 'erb'

class Tsoha < Sinatra::Base

  enable :sessions
  set :public, File.dirname(__FILE__) + "/public"

  get '/' do
    @esimerkkimuuttuja = "tämä on muuttuja"
    @sessiosta_muuttujaan = session[:muuttuja]
    erb :index
  end

  get '/sessioon/:arvo' do
    session[:muuttuja] = params[:arvo]
    redirect '/'
  end

end
