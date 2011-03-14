require 'rubygems'
require 'dm-core'
require 'dm-migrations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
end

User.auto_migrate! unless User.storage_exists?
