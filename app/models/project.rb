class Project < ApplicationRecord
  has_many :apps, dependent: :destroy

  validates_presence_of :title, :created_by
end
