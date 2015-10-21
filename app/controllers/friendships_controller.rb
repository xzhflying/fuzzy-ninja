class FriendshipsController < ApplicationController
  def create
    @target_user = User.find_by_email(params[:friendship][:email])

    unless @target_user.nil?
      @friendship = Friendship.new(user_id: current_user.id, friend_id: @target_user.id)
      @friendship.save
    end

    redirect_to :my_friends
  end

  def my_friends
    @friendships = Friendship.where("(user_id = ? OR friend_id = ?) AND accepted = 1", current_user.id, current_user.id)
    @requests = Friendship.where('friend_id = ? AND accepted = 0', current_user.id)
  end

  def grant_request
    @friendship = Friendship.find_by_id(params[:id])
    @friendship.granted!
    @friendship.save
    redirect_to my_friends_path
  end
end
