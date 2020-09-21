module DeviseWhitelist
    extend ActiveSupport::Concern

    # Jordan has before_filter in the included method that was throwing error to the server suggesting before_action instead
    included do 
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
