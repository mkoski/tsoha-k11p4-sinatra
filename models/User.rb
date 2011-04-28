require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :username, String, :required => true, :unique => true,
    :message => "Username already exists!"
  property :password, String, :required => true
end

DataMapper.finalize
DataMapper.auto_migrate!