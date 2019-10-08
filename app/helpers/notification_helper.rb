module NotificationHelper
  def uncheck_notifications
    notifications = Notification.where(result_id: current_user.results.select(:id)).order('created_at DESC')
    uncheck_notifications = notifications.where(check: false).count
  end
end
