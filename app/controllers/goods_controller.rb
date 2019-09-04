class GoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @results = Result.find(Good.group(:result_id).order('count(result_id) DESC').limit(20).pluck(:result_id))
  end

  def create
    @result = Result.find(params[:result_id])
    current_user.good(@result)
    # reloadを実行するとデータベースの値を取得しています。 カウント調整
    @result.reload
  end

  def destroy
    @result = Result.find(params[:result_id])
    current_user.ungood(@result)
    @result.reload
  end
end
