class Admins::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  protected

  def after_sign_in_path_for(resource)
    teams_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end 