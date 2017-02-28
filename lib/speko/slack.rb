require 'speko/slack/base'
require 'speko/slack/client'
require 'speko/slack/config'
require 'speko/slack/version'

# All methods are module methods and should be called on the Speko::Slack module.
#
# Examples
#
#   Speko::Slack.configure
#   # => {}
module Speko
  module Slack
    class << self
      require 'slack-ruby-client'

      # Returns the Hash values for configurations settings
      attr_reader :config

      def table_name_prefix
        'slack_'
      end

      # Returns boolean value - determined if config is set or not
      def configured?
         !!config
      end

      # Returns a Hash of enabled configuration settings.
      # It will default to: []
      def enabled_configs
        config.try(:enabled_configs) || []
      end

      # Returns a global Config object
      def configure(settings)
        @config = Config.new(settings)
      end
    end
  end
end

# Configure default settings
Speko::Slack.configure({
  slack_api_token: ENV['SLACK_API_TOKEN'],
  slack_channel: ENV['SLACK_CHANNEL']
})

# Return a new Speko::Slack::Client object
SlackClient = Speko::Slack::Client.new
