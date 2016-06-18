class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  after_create { User.delay.subscribe_to_mailchimp_list(self.id) }

  validates :first_name, :last_name, presence: true

  def self.subscribe_to_mailchimp_list(user_id)
    user = User.find(user_id)

    response = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(
      body: {
        email_address: user.email,
        status: "subscribed",
        merge_fields: {
          FNAME: user.first_name,
          LNAME: user.last_name,
          DISTRICT: user.district,
          CELLPHONE: user.cell_phone_number
        }
      }
    )

    user.update_attribute(:mailchimp_id, response["id"])
  end
end
