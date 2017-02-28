require 'rails/generators/migration'

module Speko
  module Slack
    class MigrationsGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates migration files inside `db/migrations` to make it easy to configure the database.'

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "migrations/create_slack_database_integration.rb", "db/migrate/create_slack_database_integration.rb"
      end
    end
  end
end
