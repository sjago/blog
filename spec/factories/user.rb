FactoryGirl.define do
  factory :user do
    email { 's@s.com' }
    name { 'Sean' }
    password { 'sspassword' }
    age { 3 }
  end
end