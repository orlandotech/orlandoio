class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email,:full_name, :password, :password_confirmation)
  end
  private :resource_params
end