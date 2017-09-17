class RemoveImageFromApps < ActiveRecord::Migration[5.1]
  def change
    remove_column :apps, :image
  end
end
