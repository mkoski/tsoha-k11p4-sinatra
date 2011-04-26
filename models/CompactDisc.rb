require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

class CompactDisc
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :required => true
  property :artist, String, :required => true
  property :released, Integer
  property :record_company, String
  property :genre, String
  property :picture, Text, :length => 500

  def self.search(title, artist, released, genre) 
    search_results = self.all
    if title != ""
      search_results = search_results.all(:title => title )
    end
    if artist != ""
      search_results = search_results.all(:artist => artist)
    end
    if released != ""
      search_results = search_results.all(:released => released)
    end
    if genre != ""
      search_results = search_results.all(:genre => genre)
    end
    return search_results
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!