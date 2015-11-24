class Mission < ActiveRecord::Base
  enum status: { unfinished: 0, finished: 1 }

  belongs_to :user, inverse_of: :missions
  has_many :supervisions, dependent: :destroy
  has_many :supervisors, through: :supervisions, class_name: User.name
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: nil
end
