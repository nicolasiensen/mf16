class UsersController < ApplicationController
  layout "user"

  def search
    authorize User
    @users = User.where("email LIKE ?", "%#{params[:search_query]}%")
  end
end
