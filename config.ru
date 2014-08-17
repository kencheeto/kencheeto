require 'rack'

use Rack::Static,
  urls: ['/css', '/images'],
  root: '.'

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/html',
      'Cache-Control' => 'public, max-age=3600'
    },
    File.open('index.html', File::RDONLY)
  ]
}
