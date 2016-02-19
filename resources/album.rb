# [PATCH] seems not implemented with webmachine:
# https://github.com/webmachine/webmachine-ruby/issues/109

# all the callbacks:
# https://github.com/webmachine/webmachine-ruby/blob/master/lib/webmachine/resource/callbacks.rb
class AlbumResource < Webmachine::Resource
  def allowed_methods
    if id
      %w(GET HEAD DELETE PUT)
    else
      %w(POST GET)
    end
  end

  def resource_exists?
    id ? album : albums
    # 404 always return html there is a workaround here that I didn't like:
    # https://github.com/webmachine/webmachine-ruby/issues/142
  end

  def allow_missing_post?
    true
  end

  def post_is_create?
    true
  end

  def create_path
    @album = Album.new(params)
    if @album.save
      @album.extend(AlbumRepresenter).from_json(@album.to_json) # could improve
      @album.links[:self].href
    end
  end

  def delete_resource
    true if album.destroy
  end

  def content_types_accepted
    [['application/json', :from_json]]
  end

  def content_types_provided
    [['application/hal+json', :to_json]]
  end

  private

  def id
    request.path_info[:id]
  end

  def params
    # I prefer the option to use strong_params instead of Roar #from_json
    JSON.parse request.body.to_s
  end

  def to_json
    if id
      AlbumRepresenter.prepare(album).to_json
    else
      { albums: albums }.to_json
    end

    # Hipster version:
    # return AlbumRepresenter.prepare(album).to_json if request.path_info[:id]
    # { albums: albums }.to_json
  end

  def from_json
    if request.put?
      if album.update(params)
        response.body = AlbumRepresenter.prepare(album).to_json
      end
      # I know that PUT should actually replace the Model(destroy then create)
      # I wanted to implement PATCH but it isn't supported yet in webmachine
    end
  end

  def albums
    @albums = Album.last(15) # no memoization for sanity
  end

  def album
    @album ||= Album.find_by(id: id)
  end
end
