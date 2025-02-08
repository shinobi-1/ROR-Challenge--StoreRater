module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      super
    end

    # POST /resource
    def create
      super
    end

    # PATCH / PUT /resource
    def update
      super
    end

    # Additional parameters for sign-up
    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
    end

    # Additional parameters for account updates
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address])
    end

    # Path after successful sign-up
    def after_sign_up_path_for(resource)
      root_path # Or replace with a custom path
    end

    # Path for inactive accounts after sign-up
    def after_inactive_sign_up_path_for(resource)
      root_path # Or replace with a custom path
    end
  end
end
