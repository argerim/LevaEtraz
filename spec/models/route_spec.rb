require 'rails_helper'

RSpec.describe Route, type: :model do
  context 'Validations' do
    [:origin_id, :destination_id, :distance].each do |attr|      
      it { validate_presence_of(attr) }
    end
  end

  context 'Associations' do
    [:origin, :destination].each do |asso|
      it { belong_to(asso) }
    end
  end
end
