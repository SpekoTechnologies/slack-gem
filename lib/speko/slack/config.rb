module Speko
  module Slack
    class Config
      attr_reader :enabled_configs

      def initialize(configs)
        ::Slack.configure do |config|
          config.token = configs[:slack_api_token]
        end

        @enabled_configs = configs
      end
    end
  end
end
