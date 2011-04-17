# A sample Gemfile
source "http://rubygems.org"

gem "sinatra"
gem "data_mapper"


group :production do
  gem "dm-postgres-adapter"
end

group :development do
  gem "dm-sqlite-adapter"
  gem "thin"
  gem "heroku"
end
