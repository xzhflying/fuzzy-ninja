class Mission < ActiveRecord::Base
  enum status: { unfinished: 0, finished: 1 }
  enum supervised: { unsupervised: 0, supervised: 1 }

  belongs_to :user, inverse_of: :missions
  has_many :comments, dependent: :destroy
  has_many :supervisions, dependent: :destroy
end
