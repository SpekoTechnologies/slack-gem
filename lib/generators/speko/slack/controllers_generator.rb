require 'rails/generators'

module Speko
  module Slack
    class ControllersGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates controller files inside `app/controllers` to make it easy to add more Speko::Slack controllers'

      def create_views
        @controllers_path_prefix = 'controllers/slack'
        remove_dir "app/#{@controllers_path_prefix}"
        directory "#{@controllers_path_prefix}", "app/#{@controllers_path_prefix}"
      end
    end
  end
end
