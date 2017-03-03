FactoryGirl.define do

  factory :group do
    name    Faker::Name.name
    user_ids "1 , 2"
  end
end
