class Group < ActiveRecord::Base
  validates :kind, :name, presence: true
  validates :district, presence: true, if: :territorial?
  validates :theme, presence: true, if: :thematic?

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
