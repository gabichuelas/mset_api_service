# Set up gems listed in the Gemfile.
require 'bundler/setup'
Bundler.require

# would require any files needed in environment,
# such as api keys

# connect this config file to the rest of the main app
# and then run the app

require_relative './api_calls'
run Sinatra::Application
