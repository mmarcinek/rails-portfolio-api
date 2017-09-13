class App < ApplicationRecord
  belongs_to :project, optional: true

  validates_presence_of :name
end
