class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.result_id = params[:result_id]
    
    @result = Result.find(params[:result_id])
    @comments = Comment.where(result_id: @result.id)
    
    @comment_save = @comment.save
     
    # if @comment.save
    #   flash[:success] = 'コメントを投稿しました'
    #   redirect_back(fallback_location: root_path)
    # else
    #   @result = Result.find(params[:result_id])
    #   @comments = Comment.where(result_id: @result.id)
    #   flash[:danger] = 'コメントの投稿に失敗しました'
    #   render 'results/show'
    # end
  end

  def destroy
    @result = Result.find(@comment.result_id)
    @comments = Comment.where(result_id: @result.id)
    @comment.destroy
    
    # flash[:danger] = 'コメントを削除しました'
    # redirect_back(fallback_location: root_path)
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
