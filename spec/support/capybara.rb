require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  fetch_current_example = if RSpec.respond_to?(:current_example)
    proc { RSpec.current_example }
  else
    proc { |context| context.example }
  end

  # The before and after blocks must run instantaneously, because Capybara
  # might not actually be used in all examples where it's included.
  config.after do
    if self.class.include?(Capybara::DSL)
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
  config.before do
    if self.class.include?(Capybara::DSL)
      example = fetch_current_example.call(self)
      Capybara.current_driver = Capybara.javascript_driver if example.metadata[:js]
      Capybara.current_driver = example.metadata[:driver] if example.metadata[:driver]
    end
  end
end

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path('../../../', __FILE__)
  set :show_exceptions, true
  set :environment, :test
end
