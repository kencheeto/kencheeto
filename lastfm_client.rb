require 'faraday'
require 'faraday_middleware'

module LastFM
  class Client
    def initialize key
      @key = key
      @conn = Faraday.new( url: root_url ) do |conn|
        conn.response :mashify
        conn.response :json, :content_type => /\bjson$/
        conn.adapter :net_http
      end
    end

    def loved_tracks
      mash = api 'user.getLovedTracks'
      mash.lovedtracks.track
    end

    def top_artists
      mash = api 'user.getTopArtists'
      mash.topartists.artist
    end

    private

    def api method, user: 'kencheeto'
      response = @conn.get '', defaults.merge({
        method: method,
        user: user
        })

      response.body
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
end
