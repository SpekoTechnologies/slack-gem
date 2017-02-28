require 'rails/generators'

module Speko
  module Slack
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates view files inside `app/views` to make it easy to add more Speko::Slack views'

      def create_views
        @views_path_prefix = 'views/slack'

        remove_dir "app/#{@views_path_prefix}"
        directory "#{@views_path_prefix}", "app/#{@views_path_prefix}"
      end
    end
  end
end
