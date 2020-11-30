class Ping < SlackRubyBotServer::Events::AppMentions::Mention
  mention 'ping'

  def self.call(data)
    client = Slack::Web::Client.new(token: data.team.token)
    client.chat_postMessage(channel: data.channel, text: 'pong')
  end
end
