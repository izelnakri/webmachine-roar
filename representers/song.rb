module SongRepresenter
  include Roar::JSON
  include Roar::JSON::HAL

  property :id
  property :name

  link :self do
    "/songs/#{id}"
  end
end
