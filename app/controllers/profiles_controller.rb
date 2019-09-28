class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_new_setting, only:[:new]
  before_action :profile_setting, only:[:edit]
  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      flash[:success] = "プロフィールを設定しました"
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = "プロフィールの設定に失敗しました"
      render 'new'
    end
  end

  def edit
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
      flash[:success] = "プロフィールを設定しました"
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = "プロフィールの設定に失敗しました"
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:yourself, :skill, :twitter_account, :github_account)
  end

  def profile_new_setting
    @profile = Profile.find_by(user_id: current_user.id)
      if @profile
        redirect_to edit_profile_url(current_user)
      end
  end

  def profile_setting
    @profile = Profile.find_by(user_id: current_user.id)
    unless @profile
      redirect_to new_profile_url
    end
  end
end
