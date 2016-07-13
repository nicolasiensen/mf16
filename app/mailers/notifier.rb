class Notifier < ApplicationMailer
  default from: "Democracia Nos Debates <contato@psolrj.com.br>"

  def welcome user
    @user = user
    mail(to: @user.email, subject: "Bem-vindo à campanha Marcelo Freixo 2016")
  end

  def debate_petition user
    @user = user
    mail(to: @user.email, subject: "Valeu pelo apoio! Agora vamos botar mais pressão!")
  end
end
