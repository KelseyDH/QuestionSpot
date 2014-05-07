class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    oauth_data = request.env["omniauth.auth"].to_hash

    user = User.find_or_create_from_twitter(oauth_data)
    
    sign_in user

    #redirect_to questions_path

    render json: request.env["omniauth.auth"].to_json
  end

end
