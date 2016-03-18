class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    @message.user = current_user
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
