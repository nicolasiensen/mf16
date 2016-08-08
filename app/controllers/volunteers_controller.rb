class VolunteersController < ApplicationController
  layout "splash"

  def new
    skip_authorization
    @user = flash[:user_id].present? ? User.find(flash[:user_id]) : User.new
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
        new_volunteer_path(profile_created: true),
        flash: {user_id: @user.id},
        anchor: "edit_user_#{@user.id}"
      )
    else
      render :new
    end
  end

  def update
    skip_authorization

    user = User.find(params[:id])
    user.update_attributes(user_params)

    redirect_to new_volunteer_path(profile_completed: true), anchor: "profile_completed"
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
      :school,
      favorite_topics: [],
      favorite_tasks: []
    )
  end
end
