FactoryGirl.define do

  factory :message do
    body     { Faker::Name.name }
    user_id  "1"
    group_id "1"
  end

end