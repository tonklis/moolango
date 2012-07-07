class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def facebook
		@user = User.find_for_facebook_oauth(auth_hash, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = auth_hash.except("extra")
      redirect_to new_user_registration_url(@user)
    end
		
    #@user = User.find_for_facebook_oauth(auth_hash, current_user)
    #sign_in @user
		#if @usuario.persisted?
    # sign_in @user
    #else
		#	@user.save!
		#	sign_in @user
    #  #return redirect_to new_user_registration_path
    #end
  end

	def auth_hash
		request.env["omniauth.auth"]
	end

end
