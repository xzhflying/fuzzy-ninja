FactoryGirl.define do
  factory :mission_comment, class: Mission::Comment.name do
    user
    mission
    content 'test'
  end
end
