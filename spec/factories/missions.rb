FactoryGirl.define do
  factory :mission do
    user
    target 'test target'
    description 'Test'
    status :unfinished
  end
end
