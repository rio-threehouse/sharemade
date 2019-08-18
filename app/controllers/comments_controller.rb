class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.result_id = params[:result_id]
    if @comment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_back(fallback_location: root_path)
    else
      @result = Result.find(params[:result_id])
      flash[:danger] = 'コメントの投稿に失敗しました'
      render 'results/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:danger] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to results_url
    end
  end
end
