class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  # 1. Enable authentication for the entire application
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, if: -> { params[:controller].start_with?("admin/")}

  # Skip for Devise controllers (Sessions, Registrations, Passwords, etc.)
  skip_before_action :authenticate_user!, if: -> { controller_name == "sessions" || controller_name == "registrations" || controller_name == "passwords" }

  skip_before_action :authenticate_user!, if: :public_request?

  private

  def public_request?
    controller_name == "books" && action_name == "index" || action_name == "show"
  end
end