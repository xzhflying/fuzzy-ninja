class Friendship < ActiveRecord::Base
  validate :check_id_different
  validates_uniqueness_of :friend_id, scope: :user_id

  enum accepted: { granted: 0, unaccepted: 1 }

  belongs_to :user, inverse_of: :friendships
  belongs_to :friend, class_name: 'User', inverse_of: :friendships

  private
    def check_id_different
      errors.add(:friend_id, "不能添加自己为好友") if user_id == friend_id
    end
end
