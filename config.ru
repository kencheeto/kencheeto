require './kencheeto'

configure :production do
  require 'newrelic_rpm'
end

run Sinatra::Application
