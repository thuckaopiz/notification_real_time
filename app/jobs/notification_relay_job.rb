class NotificationRelayJob < ApplicationJob
  def perform(comment)
    ActionCable.server.broadcast "notifications_channel",
      notification: comment.to_json
  end
end
