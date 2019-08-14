class ResultsController < ApplicationController
  before_action :authenticate_user!
  def index
    @results = Result.all.order('created_at DESC')
  end

  def show
    @result = Result.find(params[:id])
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
  end

  def destroy
  end

  private

  def result_params
    params.require(:result).permit(:subtitle, :title, :detail, :url, :github)
  end
end
