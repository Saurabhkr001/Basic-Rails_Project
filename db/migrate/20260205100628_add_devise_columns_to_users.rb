class AddDeviseColumnsToUsers < ActiveRecord::Migration[8.1]
  def change
    ## Database authenticatable
    # We add this column only if it doesn't exist yet
    unless column_exists?(:users, :encrypted_password)
      add_column :users, :encrypted_password, :string, null: false, default: ""
    end

    ## Recoverable
    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
      add_column :users, :reset_password_sent_at, :datetime
    end

    ## Rememberable
    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end

    ## Trackable (Optional - highly recommended)
    # Uncomment these if you want to track sign ins
    # unless column_exists?(:users, :sign_in_count)
    #   add_column :users, :sign_in_count, :integer, default: 0, null: false
    #   add_column :users, :current_sign_in_at, :datetime
    #   add_column :users, :last_sign_in_at, :datetime
    #   add_column :users, :current_sign_in_ip, :string
    #   add_column :users, :last_sign_in_ip, :string
    # end

    ## Add Indexes for performance
    unless index_exists?(:users, :email)
      add_index :users, :email, unique: true
    end
    
    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end
  end
end