class SignInRelayJob < ApplicationJob
  def perform(user)
    ActionCable.server.broadcast "sign_in",
      message: user.to_json
  end
end
