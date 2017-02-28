require 'rails/generators'

module Speko
  module Slack
    class AssetsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates asset files inside `app/assets` to make it easy to add more Speko::Slack assets'

      def create_assets
        @assets_path_prefix = 'assets/javascripts/slack'

        remove_dir "app/#{@assets_path_prefix}"
        directory "#{@assets_path_prefix}", "app/#{@assets_path_prefix}"
      end
    end
  end
end
