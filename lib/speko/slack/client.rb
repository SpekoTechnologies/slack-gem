# All methods are class methods and should be called on the Speko::Slack::Client class.
#
# Examples
#
#   Speko::Slack::Client.new.post("Hello World", :info, nil, {user: 'Some User', some_key: "some_value"})
# => true
module Speko
  module Slack
    class Client < Base

      # Initializer
      def initialize
        # TODO
      end

      # Post a message to Slack.
      # Returns a boolean value
      def post(message, code, channel = nil, *args)
        items = generate_args(args)

        client.chat_postMessage(
          channel: "#" + determine_channel(channel),
          as_user: true,
          attachments: [
            {
              fallback: "#{message}\n\n",
              pretext: "#{message}\n\n",
              color: Speko::Slack.enabled_configs[:codes][code],
              fields: generate_message(items.merge(level: key_to_string(code).downcase)),
              footer: items[:user] || 'unknown user?',
              ts: DateTime.now
            }
          ]
        )
      rescue
        Rails.logger.debug "Could not post to Slack."
        false
      end

      private

      # Return a global Slack::Web::Client object
      def client
        @client ||= ::Slack::Web::Client.new
      end
    end
  end
end
