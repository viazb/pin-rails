class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  check_authorization unless: :devise_controller #no permite el ingreso a un usuario a un metodo que no este utilizando authorize, a menos que se este trabajando en un controlador de devise.

  rescue_from CanCan::AccessDenied do |exception|
          respond_to do |format|
            format.html { redirect_to root_path, notice: 'No tienes acceso a esta página!' }
          end
      end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
 end
end
