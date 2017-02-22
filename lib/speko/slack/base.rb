module Speko
  module Slack
    class Base
      def initialize
        # TODO
      end

      def default_channel
        Speko::Slack.enabled_configs[:slack_channel]
      end

      def determine_channel(channel)
        channel || default_channel
      end

      def generate_message(message, args)
        # Determine if args is a multi-hash item or not
        args.try(:first).try(:count) > 0 && args.try(:first).is_a?(Hash) ? items = args.first : items = args

        info = "#------- New Message -------\n"
        info += "#{message}\n"
        items.each{|k,v| info += "#{k.to_s.camelize.underscore.split('_').collect{|c| c.capitalize}.join(' ')}: #{v}"; info += "\n"}
        info += "#\n\n\n"

        <<~HEREDOC
        #{info}
        HEREDOC
      end
    end
  end
end
