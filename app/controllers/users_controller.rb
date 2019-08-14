class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @results = @user.results.order('created_at DESC')
    counts(@user)
  end
end
