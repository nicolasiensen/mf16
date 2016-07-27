class VolunteersController < ApplicationController
  layout "splash"

  def new
    skip_authorization
    @user = User.new
  end

  def create
    skip_authorization
    password = Digest::SHA256.hexdigest(Time.now.to_s)
    @user = User.new user_params.merge({
      password: password,
      password_confirmation: password
    })

    if @user.save
      redirect_to new_volunteers_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :district,
      :cell_phone_number
    )
  end
end
