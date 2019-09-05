class AddCountToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :visit, :integer, default: 0
  end
end
