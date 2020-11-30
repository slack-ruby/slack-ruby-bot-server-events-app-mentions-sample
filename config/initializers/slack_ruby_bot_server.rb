# frozen_string_literal: true

SlackRubyBotServer.configure do |config|
  config.oauth_version = :v2
  config.oauth_scope = ['app_mentions:read', 'im:history', 'chat:write']
end
