class RemoveTableApps < ActiveRecord::Migration[5.1]
  def change
    drop_table :apps
  end
end
