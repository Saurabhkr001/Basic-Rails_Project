class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @recipient = User.find(params[:id])
    @messages = Message.where(
      "(user_id = ? AND recipient_id = ?) OR (user_id = ? AND recipient_id = ?)",
      current_user.id, @recipient.id, @recipient.id, current_user.id
    ).order(:created_at)

    @message = Message.new
  end
end