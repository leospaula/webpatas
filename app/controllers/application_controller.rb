class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :address, :telephone,
                                                :website, :description, :logo,
                                                :accept_credit_card,
                                                :accept_debit_card, :delivers,
                                                :delivery_hours, :business_hours,
                                                :cnpj]

    devise_parameter_sanitizer.for(:account_update) << [:name, :address, :telephone,
                                                :website, :description, :logo,
                                                :accept_credit_card,
                                                :accept_debit_card, :delivers,
                                                :delivery_hours, :business_hours,
                                                :cnpj]

  end

  private

  def pundit_user
    current_store
  end
end
