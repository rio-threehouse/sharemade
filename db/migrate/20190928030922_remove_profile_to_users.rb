class RemoveProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :yourself, :string
    remove_column :users, :skill, :string
  end
end
