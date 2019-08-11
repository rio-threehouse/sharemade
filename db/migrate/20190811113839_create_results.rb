class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :title
      t.text :detail
      t.text :url
      t.text :github

      t.timestamps
    end
  end
end
