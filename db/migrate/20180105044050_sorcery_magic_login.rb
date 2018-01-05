class SorceryMagicLogin < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :magic_login_token, :string, :default => nil
    add_column :authentications, :magic_login_token_expires_at, :datetime, :default => nil
    add_column :authentications, :magic_login_email_sent_at, :datetime, :default => nil

    add_index :authentications, :magic_login_token
  end
end
