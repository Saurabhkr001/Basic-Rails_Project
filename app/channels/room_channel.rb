class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "chat_#{params[:room]}"
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # We usually save messages via Controller, not directly through `speak` for security/validations
  end
end