require 'bundler'

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
Bundler.require :default, :test, :development, :debug
Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }

def application 
  # root_dir = File.expand_path("../../fixtures/#{fixture_path}", __FILE__)
  # if File.exists?(File.join(root_dir, "source"))
  #   ENV["MM_SOURCE"] = "source"
  # else
  #   ENV["MM_SOURCE"] = ""
  # end

  initialize_commands = @initialize_commands || []
  initialize_commands.unshift lambda {
    # set :root, root_dir
    set :environment, :test
    set :show_exceptions, false
  }

  app ||= Middleman::Application.server.inst do
    initialize_commands.each do |p|
      instance_exec(&p)
    end
  end
  app
end

