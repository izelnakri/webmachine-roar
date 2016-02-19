module ArtistRepresenter
  include Roar::JSON
  include Roar::JSON::HAL

  property :id
  property :name

  link :self do
    "/artists/#{id}"
  end
end
