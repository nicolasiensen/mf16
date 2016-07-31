class EventPolicy
  attr_reader :current_user, :event

  def initialize(current_user, event)
    @current_user = current_user
    @event = event
  end

  def new?
    current_user.present? && current_user.admin?
  end

  def create?
    current_user.present? && current_user.admin?
  end
end
