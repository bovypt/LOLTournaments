class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  protected

  def after_sign_up_path_for(resource)
    teams_path
  end

  def after_update_path_for(resource)
    teams_path
  end
end 