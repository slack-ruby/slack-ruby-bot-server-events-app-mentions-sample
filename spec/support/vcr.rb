# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/slack'
  config.hook_into :webmock
  # config.default_cassette_options = { record: :new_episodes }
  config.configure_rspec_metadata!
  config.ignore_localhost = true
end
