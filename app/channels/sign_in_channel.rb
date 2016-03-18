class SignInChannel < ApplicationCable::Channel
  def follow(data)
    # byebug
    stop_all_streams
    stream_from "sign_in"
  end

  def unfollow
    stop_all_streams
  end
end
