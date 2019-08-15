class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :yourself, :string
    add_column :users, :skill, :string, default: ""
  end
end
