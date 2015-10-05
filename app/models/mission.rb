class Mission < ActiveRecord::Base
  enum status: { unfinished: 0, finished: 1 }

  belongs_to :user, inverse_of: :missions
  belongs_to :supervisor, class_name: User.name, inverse_of: :supervisions
  has_many :comments, dependent: :destroy
end
