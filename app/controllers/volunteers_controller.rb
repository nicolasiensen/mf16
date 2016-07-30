class VolunteersController < ApplicationController
  layout "splash"

  def new
    skip_authorization
    @user = User.new
  end

  def create
    skip_authorization

    existing_user = User.find_by(email: user_params[:email])

    if existing_user.present?
      @user = existing_user
      @user.attributes = user_params
    else
      password = Digest::SHA256.hexdigest(Time.now.to_s)
      @user = User.new user_params.merge({
        password: password,
        password_confirmation: password
      })
    end

    if @user.save
      Notifier.welcome(@user).deliver_later
      redirect_to(
        new_volunteers_path,
        notice: true
      )
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
      :cell_phone_number,
      :wants_to_receive_tasks_via_whatsapp,
      :wants_to_donate,
      :school
    )
  end
end
