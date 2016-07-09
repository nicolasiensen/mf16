class UsersController < ApplicationController
  def search
    authorize User
    @users = User.where("email LIKE ?", "%#{params[:search_query]}%")
  end

  def show
    authorize User
    @user = User.find(params[:id])
  end

  def make_admin
    authorize User
    user = User.find(params[:id])
    user.admin = true
    user.save
    redirect_to user
  end
end
