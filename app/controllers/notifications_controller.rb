class NotificationsController < ApplicationController
  def index
    # result_idがcurrent_userの作った作品のidと一緒のものを取り出す
    current_user_notifications = Notification.where(result_id: current_user.results.select(:id)).order('created_at DESC')
    @uncheck_notifications = current_user_notifications.where(check: false)
    @check_notifications = current_user_notifications.where(check: true).limit(10)
    
    @uncheck_notifications.each do |notification|
      notification.update(check: true)
    end
    

  end
end
 