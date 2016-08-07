class GroupSubscriptionsController < ApplicationController
  def create
    authorize GroupSubscription
    @group_subscription = GroupSubscription.new(group_subscription_params.merge(group_id: params[:group_id]))

    if @group_subscription.save
      redirect_to group_path(params[:group_id]), flash: {group_subscription_created: true}
    else
      @group = Group.find(params[:group_id])
      render "groups/show"
    end
  end

  private

  def group_subscription_params
    params.require(:group_subscription).permit(:email, :phone)
  end
end
