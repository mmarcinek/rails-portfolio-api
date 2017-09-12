require 'rails_helper'

RSpec.describe App, type: :model do
  # Ensure App belongs to a single Project record
  it { should belong_to(:project) }

  # Validates presence of name
  it { should validate_presence_of(:name) }
end
