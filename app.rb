# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

Bundler.require :default

require_relative 'lib/mentions'

Dir[File.expand_path('config/initializers', __dir__) + '/**/*.rb'].sort.each do |file|
  require file
end

Mongoid.load!(File.expand_path('config/mongoid.yml', __dir__), ENV['RACK_ENV'])
