class Mission::Controller < ApplicationController
  load_and_authorize_resource :mission

  def mission_board
    render 'mission/mission_board'
  end
end
