class Mission::Controller < ApplicationController
  def mission_board
    @target_user = User.find_by_email(params[:email])

    unless @target_user.nil?
      @friendship = Friendship.new(user_id: current_user.id, friend_id: @target_user.id)
      @friendship.save
    end

    render 'mission/mission_board'
  end
end
