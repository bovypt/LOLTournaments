class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  protected

  def authenticate_user!
    return if devise_controller?
    unless user_signed_in? || admin_signed_in?
      redirect_to new_user_session_path, alert: "Please sign in to perform this action."
    end
  end

  def authenticate_admin!
    return if devise_controller?
    unless admin_signed_in?
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end
end
