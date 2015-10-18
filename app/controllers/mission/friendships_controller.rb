class Mission::FriendshipsController < Mission::Controller
  def create
    @target_user = User.find_by_email(params[:email])

    unless @target_user.nil?
      @friendship = Friendship.new(user_id: current_user.id, friend_id: @target_user.id)
      @friendship.save
    end

    render 'mission/mission_board'
  end

  def my_friends
    @friendships = current_user.friendships.all
  end

  def grant_request
    @friendship = Friendship.find_by_id(params[:id])
    @friendship.granted!
    @friendship.save
    redirect_to my_friends_path
  end
end
