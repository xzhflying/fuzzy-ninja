class Mission::CommentsController < Mission::Controller
  load_and_authorize_resource :comments,
                              class: Mission::Comment.name,
                              through: :mission,
                              except: :create
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.commentable_type == 'Mission::Supervision'
      @comment.commentable_id = @mission.supervisions.find_by_supervisor_id(current_user).id
    end
    if @comment.save
      redirect_to :back, success: '留言创建成功'
    else
      redirect_to :back, failure: '留言创建失败'
    end
  end

  def comment_params
    params.require(:comment).permit(:commentable_type, :content)
  end
end
