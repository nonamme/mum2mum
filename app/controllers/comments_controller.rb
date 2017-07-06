class CommentsController < ApplicationController
  layout false

  def add
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added properly"
      redirect_to show_profile_path params[:comment][:commenter_id]
    else
      flash[:error] = "Can not add this comment"
      redirect_to show_profile_path params[:comment][:commenter_id]
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter_id, :user_id, :comment)
    end
end
