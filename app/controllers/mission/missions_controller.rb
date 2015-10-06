class Mission::MissionsController < Mission::Controller
  def my_missions
    @my_missions = current_user.missions unless current_user.nil?
  end
end
