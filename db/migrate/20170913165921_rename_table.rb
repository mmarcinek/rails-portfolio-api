class RenameTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :table_for_apps, :apps
  end
end
