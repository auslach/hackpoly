class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  @@template = { confirm: "hp-emailconfirm|body", password: "hp-passwordreset|body" }

  def confirmation_instructions(record, token, opts={})
    headers["X-MC-Template"] = @@template[:confirm]
    opts[:subject] = "Hackpoly Account Confirmation"
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    headers["X-MC-Template"] = @@template[:password]
    opts[:subject] = "Hackpoly Password Reset"
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
  end

end
