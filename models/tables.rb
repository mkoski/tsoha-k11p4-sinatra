require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'



class Artist
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :bio, Text
  #has n :compactdiscs
end

class Genre
  include DataMapper::Resource
  property :genre_name, String, :key => true, :required => true
  property :description, Text
#  has n :artists
end

class RecordCompany
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
#  has n :artists
end


#DataMapper.auto_upgrade!