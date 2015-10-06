FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@ninja.com"
  end

  factory :user, aliases: [:supervisor]  do
    transient do
      emails_count 1
    end

    email
    password '12345678'
  end
end
