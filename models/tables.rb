require 'rubygems'
require 'dm-core'
require 'dm-migrations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
end


class Artist
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :bio, Text
#  belongs_to :recordcompany
#  has n :compactdiscs
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

class CompactDisc
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :required => true
  property :artist, String, :required => true
  property :released, Integer, :required => true
  property :record_company, String, :required => true
  property :genre, String
  property :picture, String
#  belongs_to :Artist
end

