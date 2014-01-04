class Users::PasswordsController < Devise::PasswordsController
#   def resource_params
#     params.require(:user).permit(:email,:full_name, :password, :password_confirmation)
#   end
#   private :resource_params
# end



# class Users::PasswordsController < Devise::PasswordsController
#   before_filter :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :category, :current_password) }
#   end

end