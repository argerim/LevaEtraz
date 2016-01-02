FactoryGirl.define do
  factory :map do
    sequence :name do |n|
      "RJ#{n}"
    end
  end

end
