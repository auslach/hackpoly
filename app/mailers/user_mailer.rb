class UserMailer < Devise::Mailer

  def confirmation_instructions(record, token, opts={})
    options = {
      subject: "Confirm Hackpoly Account",
      email: record.email,
      global_merge_vars: [
        name: "confirm_account_link",
        content: edit_user_password(reset_password_token: token)
      ],
      template: "Confirm Account"
    }
    mandrill_send(options)
  end

  def reset_password_instructions(record, token, opts={})
  end

  def unlock_instructions(record, token, opts={})
  end

  def mandrill_send(opts={})
    message = {
      subject: "#{opts[:subject]}",
      from_name: "Hackpoly",
      from_email: "no-reply@hackpoly.com",
      to:
        [{"name" => "User",
          "email" => "#{opts[:email]}",
          "type" => "to"}],
      global_merge_vars: opts[:global_merge_vars]
    }
    sending = MANDRILL.messages.send_template(opts[:template], [], message)
  rescue Mandrill::Error => e
    Rails.logger.debug("#{e.class}: #{e.message}")
    raise
  end

end
