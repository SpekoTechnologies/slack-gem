require 'rails/generators'

module Speko
  module Slack
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates gem files inside `app/` to make it easy to add more Speko::Slack files'

      def create_install
        generate 'speko:slack:controllers'
        generate 'speko:slack:assets'
        generate 'speko:slack:views'
        generate 'speko:slack:models'
        generate 'speko:slack:migrations'
      end
    end
  end
end
