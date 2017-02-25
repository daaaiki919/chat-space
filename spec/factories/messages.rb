FactoryGirl.define do

  factory :message do
    body     { Faker::Name.name }
    user_id  "1"
    group_id "1"
    created_at "%Y/%m/%d %H:%M:%S"
  end

end
