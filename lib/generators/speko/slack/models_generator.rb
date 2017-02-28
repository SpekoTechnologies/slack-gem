require 'rails/generators'

module Speko
  module Slack
    class ModelsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates a model file inside `app/models` to make it easy to add more Speko::Slack models'

      def create_model
        @model_path_prefix = 'models/slack'

        remove_dir "app/#{@model_path_prefix}"
        directory "#{@model_path_prefix}", "app/#{@model_path_prefix}"
      end
    end
  end
end
