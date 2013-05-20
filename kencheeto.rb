# load variables into ENV from .env
require 'dotenv'; Dotenv.load

require 'sinatra'

require './lastfm_client'
require 'json'

get '/' do
  client = LastFMClient.new ENV['LASTFM_KEY']
  '<pre><code>' + JSON.pretty_generate(client.loved_tracks) + '</code></p>'
end
