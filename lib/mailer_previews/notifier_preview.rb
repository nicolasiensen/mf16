class NotifierPreview < ActionMailer::Preview
  def welcome
    Notifier.welcome(User.first)
  end

  def debate_petition
    Notifier.debate_petition(User.first)
  end
end
