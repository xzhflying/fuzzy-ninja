class Friendship < ActiveRecord::Base
  enum accepted: { granted: 0, unaccepted: 1 }

  belongs_to :user, inverse_of: :friendships
  belongs_to :friend, class_name: 'User'
end
