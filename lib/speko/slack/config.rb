# All methods are class methods and should be called on the Speko::Slack::Config class.
#
# Examples
#
#   Speko::Slack::Config.new({some_key: "some_value"})
# => some_key: {some_key: "some_value"}
module Speko
  module Slack
    class Config
      # Returns the Hash values for configurations settings
      attr_reader :enabled_configs

      # Initializer
      def initialize(configs)
        ::Slack.configure do |config|
          config.token = configs[:slack_api_token]
        end

        load(configs)
      end

      # Returns a global Hash containing enabled configuration settings
      def load(configs)
        @enabled_configs = {slack: configs}
        @enabled_configs.merge!(codes: color_codes)
      end

      # Returns a Hash of color codes mapped to warning types
      def color_codes
        {
          info: '#63C5DC',
          warning: 'warning',
          success: 'good',
          fatal: 'danger'
        }
      end
    end
  end
end
