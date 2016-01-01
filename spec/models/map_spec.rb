require 'rails_helper'

RSpec.describe Map, type: :model do

  context 'Validations' do
    it { validate_uniqueness_of(:name) }
    it { validate_presence_of(:name) }
  end

  context "Associations" do
    it { have_many(:cities) }    
  end
end
