require 'faraday'
require 'faraday_middleware'

class LastFMClient
  def initialize key
    @key = key
    @conn = Faraday.new( url: root_url ) do |conn|
      conn.response :mashify
    end
  end

  def loved_tracks
    api 'user.getLovedTracks'
  end

  def top_artists
    api 'user.getTopArtists'
  end

  private

  def api method, user: 'kencheeto'
    response = @conn.get '', defaults.merge({
      method: method,
      user: user
    })

    JSON.parse response.body
  end

  def defaults
    @defaults ||= {
      api_key: @key,
      format: 'json'
    }
  end

  def root_url
    'http://ws.audioscrobbler.com/2.0'
  end
end
