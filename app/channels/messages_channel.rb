class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    # byebug
    stop_all_streams
    stream_from "messages"
  end

  def unfollow
    stop_all_streams
  end
end
