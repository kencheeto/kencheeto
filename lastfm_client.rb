require 'faraday'
require 'json'

class LastFMClient
  def initialize key
    @key = key
    @conn = Faraday.new(
      url: root_url
    )
  end

  def loved_tracks
    response = @conn.get '', {
      method: 'user.getLovedTracks',
      api_key: @key,
      format: 'json',
      user: 'kencheeto'
    }

    JSON.parse response.body
  end

  private

  def root_url
    'http://ws.audioscrobbler.com/2.0'
  end
end
