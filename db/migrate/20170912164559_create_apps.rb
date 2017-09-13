class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.belongs_to :project, index: true
      t.string :name
      t.string :created_by
      
      t.timestamps
    end
  end
end
