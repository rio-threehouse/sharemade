class GoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @results = Result.find(Good.group(:result_id).order('count(result_id) DESC').limit(20).pluck(:result_id))
  end

  def create
    @result = Result.find(params[:result_id])
    current_user.good(@result)
    
    # 自分がいいねした時は通知しないように変更する
    unless Notification.find_by(user_id: current_user.id, result_id: @result.id, kind: 'good') || @result.user == current_user
      Notification.create(user_id: current_user.id, result_id: @result.id, kind: 'good')
    end

    @result.reload
  end

  def destroy
    @result = Result.find(params[:result_id])
    current_user.ungood(@result)
    @result.reload
  end
end
