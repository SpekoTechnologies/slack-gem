module Speko
  module Slack
    class Base
      def initialize
        # TODO
      end

      def default_channel
        ENV['SLACK_CHANNEL']
      end

      def determine_channel(channel)
        channel || default_channel
      end

      def generate_message(message, args)
        info = "#--- Message ---\n"
        info += "Message: #{message}\n"
        args.each{|k,v| info += "#{k.to_s.camelize.underscore.split('_').collect{|c| c.capitalize}.join(' ')}: #{v}"; info += "\n"}
        info += "#\n\n\n"
        <<~HEREDOC
        #{info}
        HEREDOC
      end
    end
  end
end
