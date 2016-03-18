class ChatController < ApplicationController
  before_action :authenticate_user!
  def chatroom
    @users = User.all
  end
end
