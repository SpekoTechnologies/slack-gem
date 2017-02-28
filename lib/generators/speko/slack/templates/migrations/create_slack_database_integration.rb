class CreateSlackDatabaseIntegration < ActiveRecord::Migration
  def self.up
    create_table :slack_profiles do |t|
      t.string  :name
      t.string  :description
      t.string :encrypted_api_key, limit: 255, default: ""
      t.timestamps
    end
  end

  def self.down
    drop_table :slack_profiles
  end
end
