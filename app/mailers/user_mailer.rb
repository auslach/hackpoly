class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  @@template = "hp-emailconfirm|body"

  def confirmation_instructions(record, token, opts={})
    headers["X-MC-Template"] = @@template
    opts[:subject] = "Account Confirmation Instructions | Hackpoly 2015"
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
  end

  def unlock_instructions(record, token, opts={})
  end

end
