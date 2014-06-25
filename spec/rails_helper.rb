# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require "spec_helper"
require 'pry'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
