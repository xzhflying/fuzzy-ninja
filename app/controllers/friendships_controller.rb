class FriendshipsController < ApplicationController
  load_and_authorize_resource :friendship

  def create
    @target_user = User.find_by_email(friend_info_params[:email])

    if @target_user.nil?
      redirect_to :back, failure: '用户不存在'
    else
      @friendship = current_user.friendships.build(friend_id: @target_user.id)
      if @friendship.save
        redirect_to :my_friends, success: '添加好友成功'
      else
        redirect_to :my_friends, failure: '添加好友失败'
      end
    end
  end

  def my_friends
    @friendships = current_user.friendships.granted
    @requests = Friendship.unaccepted.where(friend: current_user)
  end

  def grant_request
    @friendship.granted!
    @friendship.save

    @reverse_friendship = Friendship.new
    @reverse_friendship.user_id = @friendship.friend_id
    @reverse_friendship.friend_id = @friendship.user_id
    @reverse_friendship.granted!
    @reverse_friendship.save

    redirect_to my_friends_path
  end

  private

  def friend_info_params
    params.require(:friend_info).permit(:email)
  end
end
