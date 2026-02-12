class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      room_id = generate_room_id(current_user.id, @message.recipient_id)
      MessageBroadcastJob.perform_later(@message, room_id)
      
      respond_to do |format|
        format.html { redirect_to user_path(@message.recipient_id) }
        format.turbo_stream
      end
    else
      redirect_to user_path(@message.recipient_id), alert: "Message cannot be blank"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id)
  end

  def generate_room_id(id1, id2)
    [id1, id2].sort.join('_')
  end
end