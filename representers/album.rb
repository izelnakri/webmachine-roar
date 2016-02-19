module AlbumRepresenter
  include Roar::JSON
  include Roar::JSON::HAL

  property :id
  property :name

  link :self do
    "/albums/#{id}"
  end

  collection :artist do
    property :name
  end

  # add meta number of songs
end
