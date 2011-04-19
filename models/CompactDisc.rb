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
  #belongs_to :Artist

  def self.search(t, a)

    @title_s = t
    @artist_s = a
    if @title_s == "" && @artist_s == ""
      @search_results = self.all
    end
    if @title_s != "" and @artist_s != ""
      @search_results = self.all(:conditions => { :title => @title_s, :artist => @artist_s })
    end
    if @title_s == "" and @artist_s != ""
      @search_results = self.all(:conditions => {:artist => @artist_s })
    else
      if @title_s != ""  and @artist_s == ""
          @search_results = self.all(:conditions => { :title => @title_s})
      end
    end
  end
end

DataMapper.finalize
DataMapper.auto_migrate!