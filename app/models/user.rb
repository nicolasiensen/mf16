class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  after_create { User.delay.subscribe_to_mailchimp_list(self.id) }
  # after_create { Notifier.welcome(self).deliver_later }
  after_create { Notifier.debate_petition(self).deliver_later }
  after_save { User.delay.update_mailchimp_subscription(self.id) }
  after_save { self.upload_facebook_image }

  validates :first_name, :last_name, presence: true

  def facebook_friends
    User.where("facebook_id IN (?)", (super || []).map {|f| f["id"]})
  end

  def image
    if self.facebook_image.present?
      self.facebook_image
    else
      letter1 = self.first_name[0].downcase
      letter2 = self.last_name[0].downcase
      "https://i0.wp.com/cdn.auth0.com/avatars/#{letter1}#{letter2}.png?ssl=1"
    end
  end

  def facebook_image_large
    "#{self.facebook_image}?type=large"
  end

  def upload_facebook_image
    if self.facebook_image
      Cloudinary::Uploader.upload(
        "#{self.facebook_image}?type=large",
        public_id: "users/facebook_image/#{self.id}"
      )
    end
  end

  def self.subscribe_to_mailchimp_list(user_id)
    user = User.find(user_id)

    list = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"])
    member = list.members(Digest::MD5.hexdigest(user.email))

    begin
      response = member.retrieve
    rescue Gibbon::MailChimpError
      response = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(
        body: {
          email_address: user.email,
          status: "subscribed",
          merge_fields: {
            FNAME: user.first_name,
            LNAME: user.last_name,
            DISTRICT: user.district || "",
            CELLPHONE: user.cell_phone_number || ""
          }
        }
      )
    end

    user.update_attribute(:mailchimp_id, response["id"])
  end

  def self.update_mailchimp_subscription(user_id)
    user = User.find(user_id)

    list = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"])
    member = list.members(Digest::MD5.hexdigest(user.email))
    member.upsert(
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
  end
end
