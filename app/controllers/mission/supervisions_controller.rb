class Mission::SupervisionsController < Mission::Controller
  load_and_authorize_resource :supervision, class: Mission::Supervision.name, through: :mission,
                                            except: [:create, :my_supervisions]

  def create
    @supervision = current_user.supervisions.build(supervisor: current_user)

    if @supervision.save
      redirect_to mission_path(@mission), success: '成功发送申请'
    else
      redirect_to mission_path(@mission), alert: '申请失败'
    end
  end

  def show
  end

  def grant_supervision
    if @supervision.granted!
      redirect_to mission_path(@mission), success: '成功接受申请'
    else
      redirect_to mission_path(@mission), alert: '接受申请失败'
    end
  end

  def my_supervisions
    @supervisions = current_user.supervisions
  end
end
