class GroupSubscription < ActiveRecord::Base
  validates :email, :phone, presence: true
  validates :email, uniqueness: { scope: :group_id }
  validates :phone, uniqueness: { scope: :group_id }
end
