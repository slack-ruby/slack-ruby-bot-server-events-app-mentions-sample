Slack Ruby Bot Server Events App Mentions Sample
================================================

[![Build Status](https://travis-ci.org/slack-ruby/slack-ruby-bot-server-events-app-mentions-sample.svg?branch=master)](https://travis-ci.org/slack-ruby/slack-ruby-bot-server-events-app-mentions-sample)

## What is this?

A sample app that uses [slack-ruby-bot-server-events-app-mentions](https://github.com/slack-ruby/slack-ruby-bot-server-events-app-mentions) to implement and respond to bot mention and im events.

## Running the Sample

### Settings

Create `.env` file with the following settings.

```
SLACK_CLIENT_ID=...
SLACK_CLIENT_SECRET=...
SLACK_SIGNING_SECRET=...
SLACK_VERIFICATION_TOKEN=...
```

Get the values from from [your app's](https://api.slack.com/apps) _Basic Information_ settings.

Run `bundle install` and `foreman start`.

### Install App

Register your app via OAuth workflow from [localhost:5000](http://localhost:5000).

Expose the local server port 5000 to receive Slack events using [ngrok](https://ngrok.com).

```
ngrok http 5000
```

Copy the URL, e.g. `https://79f0f6335438.ngrok.io`, and use it as the prefix for your events, slash commands, and interactive message buttons.

### OAuth Scopes

See [config/initializers/slack_ruby_bot_server.rb](config/initializers/slack_ruby_bot_server.rb) for the required OAuth scopes. If you get `Slack::Web::Api::Errors::MissingScope: missing_scope` errors, you are missing a scope in your app configuration.

### Copyright & License

Copyright [Daniel Doubrovkine](http://code.dblock.org), 2020

[MIT License](LICENSE)
