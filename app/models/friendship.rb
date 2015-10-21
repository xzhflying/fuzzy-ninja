class Friendship < ActiveRecord::Base
  validate :check_id_different
  validates :friend_id, presence: true, uniqueness: { scope: :user_id }
  enum accepted: { unaccepted: 0, granted: 1 }

  belongs_to :user, inverse_of: :friendships
  belongs_to :friend, class_name: 'User', inverse_of: :friendships

  private

  def check_id_different
    errors.add(:friend_id, '不能添加自己为好友') if user_id == friend_id
  end
end
