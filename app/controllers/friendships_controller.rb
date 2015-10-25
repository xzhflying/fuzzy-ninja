class FriendshipsController < ApplicationController
  load_and_authorize_resource :friendship

  def create
    @target_user = User.find_by_email(friendship_params[:email])

    unless @target_user.nil?
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
    redirect_to my_friends_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:email)
  end
end
