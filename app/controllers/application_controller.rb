class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except:[:top]
  before_action :configure_permiteed_parameters,if: :devise_controller?

  def after_sigin_in_path_for(resource)
    post_images_path
  end

  protected

  def configure_permiteed_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end
end
