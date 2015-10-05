FactoryGirl.define do
  factory :mission do
    user
    supervisor
    target 'test target'
    description 'Test'
    status :unfinished
  end
end
