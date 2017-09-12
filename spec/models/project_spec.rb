require 'rails_helper'

RSpec.describe Project, type: :model do
  # Ensure the Project model has 1:many relationship with apps
  it { should have_many(:apps).dependent(:destroy) }

  # Validate presence of title and created_by before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }

end
