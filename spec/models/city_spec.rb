require 'rails_helper'

RSpec.describe City, type: :model do
  
  context 'Validations' do
    it { validate_uniqueness_of(:name).scoped_to(:map_id) }
    [:name, :map_id].each do |attr|      
      it { validate_presence_of(attr) }
    end

  end

  context "Associations" do
    it { have_many(:destinations) }    
  end
end
