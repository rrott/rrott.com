require 'bundler'

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
Bundler.require :default, :test, :development, :debug
Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }
