class UsersController < ApplicationController
  layout "user", except: [:show]

  def search
    authorize User
    @users = User.where("email LIKE ?", "%#{params[:search_query]}%")
  end

  def show
    authorize User
    @user = User.find(params[:id])
  end
end
