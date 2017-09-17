class AddImageToApps < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :apps, :image
  end

  def self.down
    remove_attachment :apps, :image
  end
end
