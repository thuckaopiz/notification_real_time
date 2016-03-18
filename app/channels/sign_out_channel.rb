class SignOutChannel < ApplicationCable::Channel
  def follow(data)
    # byebug
    stop_all_streams
    stream_from "sign_out"
  end

  def unfollow
    stop_all_streams
  end
end
