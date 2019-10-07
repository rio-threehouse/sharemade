class NotificationsController < ApplicationController
  def index
    # result_idがcurrent_userの作った作品のidと一緒のものを取り出す
    @notifications = Notification.where(result_id: current_user.results.select(:id)).order('created_at DESC')
    @notifications.where(check: 'false').each do |notification|
      notification.update(check: 'true')
    end
  end
end
 