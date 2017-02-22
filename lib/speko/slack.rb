require 'speko/slack/base'
require 'speko/slack/client'
require 'speko/slack/config'
require 'speko/slack/version'

module Speko
  module Slack
    class << self
      require 'slack-ruby-client'

      attr_reader :config

      def configured?
         !!config
      end

      def enabled_configs
        config.try(:enabled_configs) || []
      end

      def configure(settings)
        @config = Config.new(settings)
      end
    end
  end
end

Speko::Slack.configure({
  slack_api_token: ENV['SLACK_API_TOKEN'],
  slack_channel: ENV['SLACK_CHANNEL']
})

SlackClient = Speko::Slack::Client.new
