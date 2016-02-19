require 'bundler/setup'

require 'active_record'
require 'roar/json'
require 'roar/json/hal'

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

# change from WEBBrick to smt else

Webmachine.routes do
  add ['albums'], AlbumResource
  add ['albums', :id], AlbumResource
  add ['artists'], ArtistResource
  add ['artists', :id], ArtistResource
  add ['songs'], SongResource
  add ['songs', :id], SongResource
end.run
