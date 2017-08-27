FactoryGirl.define do
  factory :user do # The name matters. :cat factory returns a Cat object.
    email 'meow@meow.com'
    password 'password'
  end
end
