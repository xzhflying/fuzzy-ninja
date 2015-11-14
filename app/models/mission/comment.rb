class Mission::Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
  belongs_to :commentable, polymorphic: true
end
