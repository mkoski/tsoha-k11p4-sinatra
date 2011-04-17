require 'rubygems'
require 'sinatra'
require 'erb'

require 'config/init'
require 'models/user'
require 'models/tables'

DataMapper.finalize
DataMapper.auto_migrate!

class Tsoha < Sinatra::Base

  set :public, File.dirname(__FILE__) + "/public"
  $h2_header = "C D _ A R C H I V E<br><hr>"

# Navigations

  get '/' do
    erb :index
  end

  get '/add' do
    erb :add
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

# Actions

  post '/list' do
    @compact_discs = CompactDisc.all
    erb :listed
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
    @results = CompactDisc.get(params)
    erb :search
  end

end
