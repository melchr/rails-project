class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #  def google_oauth2
   #   @user = User.from_omniauth(request.env["omniauth.auth"])
    #if @user.persisted?
     #   sign_in @user, :event => :authentication #this will throw if @user is not activated
    #    set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
     # else
    #    session["devise.google_data"] = request.env["omniauth.auth"]
   #   end
    #  redirect_to '/'
   # end

    private
    def sign_up_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end