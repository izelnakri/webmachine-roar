require 'bundler/setup' # maybe take this out
require 'pry'

require 'active_record'
require 'roar/json'
require 'roar/hypermedia' # check if needed
require 'webmachine'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'izel_roar'
)

require './models/album'
require './models/artist'
require './models/song'
require './models/rating'

require './representers/album'
require './representers/artist'
require './representers/song'

require './resources/album'
require './resources/artist'
require './resources/song'

pry.bindings
