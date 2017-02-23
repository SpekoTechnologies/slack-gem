# All methods will be available to any class inheriting from this <base> class.
# This <base> class provides helpful methods for generating data for
# Slack notifications.
#
# Examples
#
#   self.generate_message({some_key: "some_value"})
#   # => {{title: 'some key', value: 'some_value'}}
module Speko
  module Slack
    class Base

      # Initializer
      def initialize
        # TODO
      end

      # Returns a String that contains the default Slack channel
      def default_channel
        Speko::Slack.enabled_configs[:slack][:slack_channel]
      end

      # Return a String that contains the Slack channel (defaults to default_channel)
      def determine_channel(channel)
        channel || default_channel
      end

      # Return a Hash of Hashes - formatted correctly for Slack 'attachments'
      def generate_message(args)
        fields = []

        args.each do|k,v|
          fields.push({title: "#{key_to_string(k).upcase}", value: "#{v}", short: false}) unless key_to_string(k).downcase == 'user'
        end

        fields
      end

      # Return a single Hash from the given arguments.
      # This determine if args is a multi-hash item or not.
      def generate_args(args)
        args.try(:first).try(:count) > 0 && args.try(:first).is_a?(Hash) ? args.first : args
      end

      # Return a key converted to a string
      def key_to_string(key)
        key.to_s.camelize.underscore.split('_').collect{|c| c.capitalize}.join(' ')
      end
    end
  end
end
