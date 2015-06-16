class MessagesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    msg = {
      user: current_user.email,
      content: @message.content
    }
    $redis.publish 'new-message', msg.to_json
    render :nothing => true
  end

    def message_params
      params.require(:message).permit(:content)
    end
end
