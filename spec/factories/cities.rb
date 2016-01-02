FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "A#{n}"
    end
    map
  end

end
