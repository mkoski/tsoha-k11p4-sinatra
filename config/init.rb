require 'rubygems'
require 'dm-core'

tsoha_db = File.dirname(File.expand_path(__FILE__)) + '/../tsoha.db'
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://' + tsoha_db)
