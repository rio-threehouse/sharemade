class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user_detail
    @results = @user.results.order('created_at DESC')
  end

  def goods
    user_detail
    @results = @user.good_results
  end

  private

  def user_detail
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: @user.id)
  end
end
