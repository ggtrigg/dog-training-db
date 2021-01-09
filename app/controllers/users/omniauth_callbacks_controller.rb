class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def trusona
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    # If the user already exists, update the provider & uid from omniauth.
    u = User.find_by_email @user.email
    unless u.nil?
      u.provider = @user.provider
      u.uid = @user.uid
      @user = u
    end

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      session["devise.trusona_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to root_path
    end
  end
end