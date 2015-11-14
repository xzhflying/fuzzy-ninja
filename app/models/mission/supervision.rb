class Mission::Supervision < ActiveRecord::Base
  validates :mission_id, presence: true, uniqueness: { scope: :supervisor_id }
  enum accepted: { unaccepted: 0, granted: 1 }

  belongs_to :mission, inverse_of: :supervisions
  belongs_to :supervisor, class_name: User.name, inverse_of: :supervisions
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: nil
end
