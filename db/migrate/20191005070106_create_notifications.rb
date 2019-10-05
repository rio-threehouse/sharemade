class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :result, foreign_key: true
      t.string :kind
      t.boolean :check, default: false, nil: false

      t.timestamps
    end
  end
end
