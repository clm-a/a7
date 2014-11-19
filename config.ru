require 'sprockets'

use Rack::Static,
  :urls => ["/bower_components"],
  :root => "public"

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'vendor/assets/bower_components'
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'app/assets/images'
  run environment
end

map '/' do
  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('app/index.html', File::RDONLY)
    ]
  }

end