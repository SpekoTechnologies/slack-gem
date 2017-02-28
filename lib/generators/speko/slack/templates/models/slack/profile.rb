module Speko
  module Slack
    class Profile < ActiveRecord::Base
      require 'acts-as-taggable-on'

      acts_as_taggable_on :channels

      before_save :encrypt_api_key

      def decrypt_api_key
        encrypted_api_key.blank? ? "" : ActiveSupport::MessageEncryptor.new(encryption_key).decrypt_and_verify(self.encrypted_api_key)
      end

      protected

      def encrypt_api_key
        self.encrypted_api_key = ActiveSupport::MessageEncryptor.new(encryption_key).encrypt_and_sign(self.encrypted_api_key)
      end

      def encryption_key
        Rails.application.secrets.secret_key_base
      end
    end
  end
end
