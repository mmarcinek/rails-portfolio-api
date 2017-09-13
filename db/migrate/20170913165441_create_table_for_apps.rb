class CreateTableForApps < ActiveRecord::Migration[5.1]
  def change
    create_table :table_for_apps do |t|
      t.belongs_to :projects, index: true
      t.string :name
      t.timestamps
    end
  end
end
