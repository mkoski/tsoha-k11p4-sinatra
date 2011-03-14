require 'rubygems'
require 'sinatra'

class Tsoha < Sinatra::Base

  get '/' do
    "Moi"
  end

  get '/foo' do
    "bar"
  end

end
