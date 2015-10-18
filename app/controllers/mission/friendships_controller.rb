class Mission::FriendshipsController < Mission::Controller
  def my_friends
    @friendships = Friendship.where(user_id: current_user.id)
  end
end
