class Group < ActiveRecord::Base
  validates :kind, :name, presence: true
  validates :theme, presence: true

  has_many :group_subscriptions

  def territorial?
    self.kind == "territorial"
  end

  def thematic?
    self.kind == "thematic"
  end

  def to_param
    "#{id}-#{self.name.parameterize}"
  end
end
