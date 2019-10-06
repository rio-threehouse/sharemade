class NotificationsController < ApplicationController
  def index
    # result_idがcurrent_userの作った作品のidと一緒のものを取り出す
    @notifications = Notification.where(result_id: current_user.results.select(:id))
    # ？いつcheckをtrueにするか。indexでtureにすると、viewでcheck判定ができなくなる
    # @notifications.update(check: 'true')
  end
end
 