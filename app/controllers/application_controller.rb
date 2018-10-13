class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def check_logined
    unless user_signed_in?
      redirect_to new_user_session_path
      flash[:danger] = t("devise.failure.unauthenticated")
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :picture])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def params_controller
    params[:controller]
  end

  def find_variable_name
    return if params_controller.blank?
    params_controller.split("/").last.singularize
  end

  def find_object
    instance_name = find_variable_name
    instance_variable_set "@#{instance_name}",
      instance_name.classify.constantize.find_by(id: params[:id])
    return if instance_variable_get "@#{instance_name}"
    flash[:danger] =
      I18n.t("#{instance_name.pluralize}.messages.#{instance_name}_not_found")
  end
end
