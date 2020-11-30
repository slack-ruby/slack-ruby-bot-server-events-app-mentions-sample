# frozen_string_literal: true

require 'spec_helper'

describe 'ping' do
  let!(:team) { Fabricate(:team) }

  it 'invokes ping without an argument' do
    expect_any_instance_of(Slack::Web::Client).to receive(:chat_postMessage).with(
      text: 'pong', channel: 'channel'
    )

    SlackRubyBotServer::Events.config.run_callbacks(
      :event,
      %w[event_callback app_mention],
      Slack::Messages::Message.new(
        'team_id' => team.team_id,
        'event' => {
          'channel' => 'channel',
          'text' => "<@#{team.bot_user_id}> ping"
        }
      )
    )
  end

  it 'invokes ping on a DM' do
    expect_any_instance_of(Slack::Web::Client).to receive(:chat_postMessage).with(
      text: 'pong', channel: 'channel'
    )

    SlackRubyBotServer::Events.config.run_callbacks(
      :event,
      %w[event_callback message],
      Slack::Messages::Message.new(
        'team_id' => team.team_id,
        'event' => {
          'channel' => 'channel',
          'channel_type' => 'im',
          'text' => "ping"
        }
      )
    )
  end

  it 'does not invokes ping on a non-IM channel' do
    expect_any_instance_of(Slack::Web::Client).to_not receive(:chat_postMessage)

    SlackRubyBotServer::Events.config.run_callbacks(
      :event,
      %w[event_callback message],
      Slack::Messages::Message.new(
        'team_id' => team.team_id,
        'event' => {
          'channel' => 'channel',
          'text' => "ping"
        }
      )
    )
  end

  it 'invokes ping with an argument' do
    expect_any_instance_of(Slack::Web::Client).to receive(:chat_postMessage).with(
      text: 'pong 10', channel: 'channel'
    )

    SlackRubyBotServer::Events.config.run_callbacks(
      :event,
      %w[event_callback app_mention],
      Slack::Messages::Message.new(
        'team_id' => team.team_id,
        'event' => {
          'channel' => 'channel',
          'text' => "<@#{team.bot_user_id}> ping 10"
        }
      )
    )
  end
end
