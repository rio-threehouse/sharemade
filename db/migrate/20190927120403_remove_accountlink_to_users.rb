class RemoveAccountlinkToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :twitter_account, :string
    remove_column :users, :github_account, :string
  end
end
