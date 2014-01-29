require 'dotenv'; Dotenv.load
require 'sinatra'
require 'sass'
require 'kramdown'

get '/' do
  erb :index
end

get '/stylesheet.css' do
  scss :stylesheet
end
