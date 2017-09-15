class App < ApplicationRecord
  belongs_to :project, optional: true

  validates :name, presence: true
  mount_uploader :image, ImageUploader
end
