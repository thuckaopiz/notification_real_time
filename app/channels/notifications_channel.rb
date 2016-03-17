class NotificationsChannel < ApplicationCable::Channel
  def follow(data)
    # byebug
    stop_all_streams
    stream_from "notifications_channel"
  end

  def unfollow
    stop_all_streams
  end
end
