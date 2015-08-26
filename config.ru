require 'rack'

use Rack::Deflater
use Rack::Static,
  urls: ['/assets'],
  root: '.',
  header_rules: [
    [:all, {'Cache-Control' => 'public, max-age=86400'}]
  ]

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}
