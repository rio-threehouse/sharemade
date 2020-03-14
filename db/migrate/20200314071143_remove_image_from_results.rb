class RemoveImageFromResults < ActiveRecord::Migration[5.0]
  def change
    remove_column :results, :image, :string
  end
end
