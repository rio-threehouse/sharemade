class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :subtitle
      t.string :title
      t.text :detail
      t.text :url
      t.text :github
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
