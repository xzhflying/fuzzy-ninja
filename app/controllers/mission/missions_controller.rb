class Mission::MissionsController < Mission::Controller
  def my_missions
    @my_missions = current_user.missions unless current_user.nil?
  end

  def new
    @mission = Mission.new
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def create
    @mission = Mission.new(mission_params)
    @mission['user_id'] = current_user.id

    if @mission.save
      redirect_to @mission
    else
      render 'new'
    end
  end

  def update
    @mission = Mission.find(params[:id])

    if @mission.update(mission_params)
      redirect_to @mission
    else
      render 'edit'
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end

  private

  def mission_params
    params.require(:mission).permit(:target, :description, :deadline)
  end
end
