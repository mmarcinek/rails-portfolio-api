class App < ApplicationRecord
  belongs_to :project, optional: true

  validates :name, presence: true
end
