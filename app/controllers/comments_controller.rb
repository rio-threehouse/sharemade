class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.result_id = params[:result_id]
    
    @result = Result.find(params[:result_id])
    @comments = Comment.where(result_id: @result.id)

    Notification.create(user_id: current_user.id, result_id: @result.id, kind: 'comment')
    
    @comment_save = @comment.save
  end

  def destroy
    @result = Result.find(@comment.result_id)
    @comments = Comment.where(result_id: @result.id)
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    if current_user.admin?
      @comment = Comment.find(params[:id])
    elsif @comment == nil
      redirect_to root_url
    end
  end
end
