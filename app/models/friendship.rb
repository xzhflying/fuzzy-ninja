class Friendship < ActiveRecord::Base
  enum accepted: { accepted: 0, unaccepted: 1 }

  
end
