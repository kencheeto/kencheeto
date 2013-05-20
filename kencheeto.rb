# load variables into ENV from .env
require 'dotenv'; Dotenv.load

require 'sinatra'

get '/' do
  'kencheeto'
end
