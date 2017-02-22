module Speko
  module Slack
    class Client < Base
      def initialize
        # TODO
      end

      def post(message, channel = nil, *args)
        client.chat_postMessage(
          channel: "##{determine_channel(channel)}", text: generate_message(message, args), as_user: true
        )
      rescue
        Rails.logger.debug "Could not post to Slack."
      end

      private

      def client
        @client ||= ::Slack::Web::Client.new
      end
    end
  end
end
