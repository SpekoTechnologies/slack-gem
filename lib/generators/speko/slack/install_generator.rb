require 'rails/generators'

module Speko
  module Slack
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates slack config files.'

      class << self
        def template_file_paths_map
          @default_config_path = "#{Rails.root}/config"
          {
            'slack.rb' => "#{@default_config_path}/initializers"
          }
        end
      end

      def remove_template_files
        self.class.template_file_paths_map.each_pair do |file, configure_path|
          remove_file "#{configure_path}/#{file}"
        end
      end

      def copy_template_files
        self.class.template_file_paths_map.each_pair do |file, configure_path|
          copy_file file, "#{configure_path}/#{file}"
        end
      end
    end
  end
end
