class RemoveOmniauthToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provider,     :string
    remove_column :users, :uid,          :string
    remove_column :users, :avatar,       :string
    remove_column :users, :name,         :string
    remove_column :users, :token,        :string
    remove_column :users, :token_expiry, :datetime
  end
end
