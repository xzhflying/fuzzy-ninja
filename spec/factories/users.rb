FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@ninja.com"
  end

  factory :user, aliases: [:supervisor]  do
    transient do
      emails_count 1
    end

    email
    password '123456'
  end
end
