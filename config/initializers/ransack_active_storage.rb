# config/initializers/ransack_active_storage.rb

Rails.application.config.to_prepare do
  # Re-open the existing class without trying to inherit from ApplicationRecord again
  class ActiveStorage::Attachment
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "id_value", "name", "record_id", "record_type"]
    end
  end
end