class SignOutRelayJob < ApplicationJob
  def perform(user)
    ActionCable.server.broadcast "sign_out",
      message: user.to_json
  end
end
