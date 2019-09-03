class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @result = Result.find(params[:id])
    @comments = Comment.where(result_id: @result.id)
    @comment = current_user.comments.build
  end

  def new
    @result = current_user.results.build
  end

  def create
    @result = current_user.results.build(result_params)
    if @result.save
      flash[:success] = '作品を登録しました'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = '作品の登録に失敗しました'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @result.update(result_params)
      flash[:success] = "作品情報を編集しました"
      redirect_to result_path(@result)
    else
      flash.now[:danger] = "作品情報の変更に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @result.destroy
    flash[:danger] = "作品を削除しました"
    redirect_to user_url(@result.user)
  end

  private

  def result_params
    params.require(:result).permit(:subtitle, :title, :detail, :url, :github, :image)
  end

  def correct_user
    @result = current_user.results.find_by(id: params[:id])
    if  current_user.admin?
      @result = Result.find(params[:id])
    elsif @result == nil
      redirect_to root_url
    end

  end
end
