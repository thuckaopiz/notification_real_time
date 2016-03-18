class MessageRelayJob < ApplicationJob
  def perform(message)
    result = {}
    result[:message] = message
    result[:user] = message.user
    ActionCable.server.broadcast "messages",
      message: result.to_json
  end
end
