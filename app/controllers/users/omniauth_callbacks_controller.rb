class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    current_user.update_attributes(
      facebook_token: request.env["omniauth.auth"].credentials.token,
      facebook_id: request.env["omniauth.auth"].extra.raw_info.id,
      facebook_image: request.env["omniauth.auth"].info.image
    )

    graph = Koala::Facebook::API.new(current_user.facebook_token)
    permissions = graph.get_connections("me", "permissions")

    if permissions.find {|p| p["permission"] == "user_friends" && p["status"] == "granted"}
      friends = graph.get_connections("me", "friends")
      current_user.update_attributes(facebook_friends: friends)
    end

    redirect_to edit_user_registration_url
  end

  def failure
    redirect_to root_path
  end
end
