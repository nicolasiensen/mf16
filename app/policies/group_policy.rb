class GroupPolicy
  attr_reader :current_user, :group

  def initialize(current_user, group)
    @current_user = current_user
    @group = group
  end

  def show?
    true
  end

  def new?
    current_user.present? && current_user.admin?
  end

  def create?
    current_user.present? && current_user.admin?
  end

  def edit?
    current_user.present? && current_user.admin?
  end

  def update?
    current_user.present? && current_user.admin?
  end
end
