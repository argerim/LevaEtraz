require 'rails_helper'

RSpec.describe City, type: :model do
  
  context 'Validations' do
    it { validate_uniqueness_of(:name).scoped_to(:map_id) }
    it { validate_presence_of(:name) }
  end
end
