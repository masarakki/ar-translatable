# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require "spec_helper"
require 'pry'
require 'factory_girl_rails'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
end
