class RemoveColumnFromApps < ActiveRecord::Migration[5.1]
  def change
    remove_column :apps, :created_by 
  end
end
