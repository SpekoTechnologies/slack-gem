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

      # Iterate through each slack channel send it off
      def post(message, code, slack_profiles = nil, *args)
        args.flatten!

        slack_profiles ||= [{channels: [Speko::Slack.enabled_configs[:slack][:slack_channel]], api_key: Speko::Slack.enabled_configs[:slack][:slack_api_token]}]

        slack_profiles.each do|profile|
          profile[:channels].each do|channel|
            send(profile[:api_key], channel, message, args, code)
          end
        end
      rescue
        Rails.logger.debug "Fatal: Could not post to any Slack channel."
        false
      end

      private

      # Post a message to Slack.
      # Returns a boolean value
      def send(api_key, channel, message, items, code)
        client(api_key).chat_postMessage(
          channel: "#" + channel,
          as_user: true,
          attachments: [
            {
              fallback: "#{message}\n\n",
              pretext: "#{message}\n\n",
              title: items.select{|i| i[:title]}.try(:first)[:title],
              title_link: items.select{|i| i[:title_link]}.try(:first)[:title_link],
              color: Speko::Slack.enabled_configs[:codes][code],
              fields: generate_message(items),
              footer: items.select{|i| i[:user]}.try(:first)[:user] || 'unknown user?',
              ts: DateTime.now.to_i
            }
          ]
        )
      rescue
        Rails.logger.debug "Could not post to Slack Channel: #{channel}"
        false
      end

      # Return a global Slack::Web::Client object
      def client(token)
        ::Slack::Web::Client.new(token: token || Speko::Slack.enabled_configs[:slack][:slack_api_token])
      end
    end
  end
end
