class EditColumnNameApps < ActiveRecord::Migration[5.1]
  def change
    rename_column :apps, :projects_id, :project_id
  end
end
