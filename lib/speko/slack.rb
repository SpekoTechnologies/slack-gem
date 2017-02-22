require 'speko/slack/base'
require 'speko/slack/client'
require 'speko/slack/version'

module Speko
  module Slack
    class << self
      require 'slack-ruby-client'
    end
  end
end

SlackClient = Speko::Slack::Client.new
