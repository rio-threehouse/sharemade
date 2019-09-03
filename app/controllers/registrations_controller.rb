class RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)
    if @user.update_without_current_password(account_update_params)
      sign_in @user, bypass: true
      set_flash_message :notice, :updated
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end
end
