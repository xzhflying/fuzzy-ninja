class Mission::MissionsController < Mission::Controller
  def my_missions
    @my_missions = current_user.missions unless current_user.nil?
  end

  def new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission['user_id'] = current_user.id

    @mission.save
    #redirect_to @mission
  end

  private
    def mission_params
      params.require(:mission).permit(:target, :description)
    end
end
