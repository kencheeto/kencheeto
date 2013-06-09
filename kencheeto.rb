require 'dotenv'; Dotenv.load # load variables into ENV from .env
require 'sinatra'
require 'sass'
require './lastfm_client'
require 'kramdown'

get '/' do
  erb :index
end

get '/top_artists' do
  names = lastfm_client.top_artists.map(&:name)
  '<ul>' +
    names.map{|name| '<li>' + name + '</li>'}.join +
  '</ul>'
end

get '/stylesheet.css' do
  scss :stylesheet
end

private

def lastfm_client
  @client ||= LastFM::Client.new ENV['LASTFM_KEY']
end
