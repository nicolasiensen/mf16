class SettingPolicy
  attr_reader :current_user

  def initialize(current_user, setting)
    @current_user = current_user
  end

  def edit?
    current_user.present? && current_user.admin?
  end

  def update?
    current_user.present? && current_user.admin?
  end
end
