require 'rubygems'
require 'dm-core'
require 'dm-migrations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
end

User.auto_migrate! unless User.storage_exists?

class Artist
  property :id, Serial
  property :name, String, :required => true
  property :bio, String
end

class Genre
  property :genre_name, String, :required => true
  property :description, String
end

class RecordCompany
  property :id, Serial
  property :name, String, :required => true
end

class CompactDisc
  include DataMapper::Resource
  property :id, Serial
  property :artist, String, :required => true
  property :released, String, :required => true
  property :record_company, String, :required => true
  property :genre, String
  property :picture, String
end