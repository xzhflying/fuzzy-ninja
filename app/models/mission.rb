class Mission < ActiveRecord::Base
  validates :target, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }

  enum status: { unfinished: 0, finished: 1 }

  belongs_to :user, inverse_of: :missions
  belongs_to :supervisor, class_name: User.name, inverse_of: :supervisions
  has_many :comments, dependent: :destroy
end
