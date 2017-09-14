class AddImgAndDescriptionColumnToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :image_url, :text
    add_column :apps, :description, :string
  end
end
