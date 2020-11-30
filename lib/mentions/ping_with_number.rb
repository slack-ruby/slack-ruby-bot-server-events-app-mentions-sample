class PingWithNumber < SlackRubyBotServer::Events::AppMentions::Mention
  mention(/ping[[:space:]]+(?<number>[[:digit:]]+)$/)

  def self.call(data)
    client = Slack::Web::Client.new(token: data.team.token)
    client.chat_postMessage(channel: data.channel, text: "pong #{data.match['number']}")
  end
end
