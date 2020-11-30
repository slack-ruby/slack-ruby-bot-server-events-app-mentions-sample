# frozen_string_literal: true

SlackRubyBotServer::Events::AppMentions.configure do |config|
  config.handlers = [PingWithNumber, Ping]
end
