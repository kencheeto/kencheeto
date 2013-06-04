require 'dotenv'; Dotenv.load # load variables into ENV from .env
require 'sinatra'

get '/' do
  erb :index
end

get '/top_artists' do
  names = lastfm_client.top_artists.map(&:name)
  '<ul>' +
    names.map{|name| '<li>' + name + '</li>'}.join +
  '</ul>'
end

private

def lastfm_client
  require './lastfm_client'
  @client ||= LastFM::Client.new ENV['LASTFM_KEY']
end
