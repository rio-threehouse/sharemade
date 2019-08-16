class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    result = Result.find(params[:result_id])
    current_user.good(result)
    redirect_back(fallback_location: results_path)
  end

  def destroy
    result = Result.find(params[:result_id])
    current_user.ungood(result)
    redirect_back(fallback_location: results_path)
  end
end
