class App < ApplicationRecord
  belongs_to :project, optional: true

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates :name, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
