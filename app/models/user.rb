class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  after_create { User.delay.subscribe_to_mailchimp_list(self.id) }
  after_save { User.delay.update_mailchimp_subscription(self.id) }
  after_save { self.upload_facebook_image }

  validates :first_name, :last_name, presence: true
  validates :cell_phone_number, presence: true, if: :wants_to_receive_tasks_via_whatsapp?

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

  def mailchimp_fields
    {
      email_address: self.email,
      status: "subscribed",
      interests: {
        "#{ENV["MAILCHIMP_INTEREST_ID"]}" => true,
        "#{ENV["MAILCHIMP_SIGNED_DEBATE_PETITION_INTEREST_ID"]}" => self.has_signed_debate_petition
      },
      merge_fields: {
        FNAME: self.first_name,
        LNAME: self.last_name,
        DISTRICT: self.district || "",
        CELLPHONE: self.cell_phone_number || "",
        WHATSENABL: self.wants_to_receive_tasks_via_whatsapp ? "Sim" : "Não",
        WANTDONATE: self.wants_to_donate ? "Sim" : "Não",
        SCHOOL: self.school || ""
      }
    }
  end

  def self.subscribe_to_mailchimp_list(user_id)
    user = User.find(user_id)

    list = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"])
    member = list.members(Digest::MD5.hexdigest(user.email))

    begin
      response = member.retrieve
    rescue Gibbon::MailChimpError
      response = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: user.mailchimp_fields)
    end

    user.update_attribute(:mailchimp_id, response["id"])
  end

  def self.update_mailchimp_subscription(user_id)
    user = User.find(user_id)

    list = Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"])
    member = list.members(Digest::MD5.hexdigest(user.email))
    member.upsert(body: user.mailchimp_fields)
  end

  FAVORITE_TASKS = [
    {
      mailchimp_interest_id: ENV["FAVORITE_TASK_PANFLETAGEM_MAILCHIMP_INTEREST_ID"],
      text: "Participando de panfletagens onde eu moro, trabalho ou estudo",
      slug: "participando_de_panfletagens_onde_eu_moro_trabalho_ou_estudo"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_MULTIROES_MAILCHIMP_INTEREST_ID"],
      text: "Participando de mutirões de cadastramento e contato com outros voluntários e apoiadores da campanha",
      slug: "participando_de_mutiroes_de_cadastramento_e_contato_com_outros_voluntarios_e_apoiadores_da_campanha"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_EVENTOS_MAILCHIMP_INTEREST_ID"],
      text: "Ajudando a organizar eventos da campanha na rua",
      slug: "ajudando_a_organizar_eventos_da_campanha_na_rua"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_DISTRIBUIDOR_MAILCHIMP_INTEREST_ID"],
      text: "Disponibilizando a minha casa para ser um ponto de distribuição de materiais",
      slug: "disponibilizando_a_minha_casa_para_ser_um_ponto_de_distribuicao_de_materiais"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_VIDEOS_MAILCHIMP_INTEREST_ID"],
      text: "Participando de vídeos da campanha",
      slug: "participando_de_videos_da_campanha"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_DESIGN_MAILCHIMP_INTEREST_ID"],
      text: "Ajudando com design para redes",
      slug: "ajudando_com_design_para_redes"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_FOTOGRAFIA_MAILCHIMP_INTEREST_ID"],
      text: "Ajudando com fotografia e filmagem",
      slug: "ajudando_com_fotografia_e_filmagem"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_PESQUISA_MAILCHIMP_INTEREST_ID"],
      text: "Ajudando com pesquisas de opinião coletivas pelo celular",
      slug: "ajudando_com_pesquisas_de_opiniao_coletivas_pelo_celular"
    }, {
      mailchimp_interest_id: ENV["FAVORITE_TASK_DOACAO_MAILCHIMP_INTEREST_ID"],
      text: "Doando dinheiro",
      slug: "doando_dinheiro"
    }
  ]
end
