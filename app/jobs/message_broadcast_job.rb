class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, room_id)
    # Broadcast the message to the specific room stream
    ActionCable.server.broadcast "chat_#{room_id}", {
      message: render_message(message),
      room_id: room_id,
      sender_id: message.user_id
    }
  end

  private

  def render_message(message)
    # Render a partial template as a string
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end