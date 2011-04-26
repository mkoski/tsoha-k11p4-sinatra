require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

class Artist
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :bio, Text
end

DataMapper.finalize
DataMapper.auto_upgrade!