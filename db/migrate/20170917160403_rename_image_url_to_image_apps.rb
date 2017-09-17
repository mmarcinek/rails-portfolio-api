class RenameImageUrlToImageApps < ActiveRecord::Migration[5.1]
  def change
    rename_column :apps, :image_url, :image
  end
end
