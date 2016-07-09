class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def search?
    current_user.present? && current_user.admin?
  end

  def show?
    current_user.present? && current_user.admin?
  end

  def make_admin?
    current_user.present? && current_user.admin?
  end
end
