class GroupsController < ApplicationController
  def show
    authorize Group
    @group = Group.find(params[:id].split("-")[0])
    @group_subscription = GroupSubscription.new
  end

  def new
    authorize Group
    @group = Group.new
  end

  def create
    authorize Group
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    authorize Group
    @group = Group.find(params[:id].split("-")[0])
  end

  def update
    authorize Group

    @group = Group.find(params[:id].split("-")[0])

    if @group.update_attributes(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def map
    skip_authorization
  end

  private

  def group_params
    params.require(:group).permit(
      :kind,
      :name,
      :district,
      :address,
      :email,
      :phone,
      :facebook_page,
      :facebook_group,
      :theme,
      :description
    )
  end
end
