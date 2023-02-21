class UserMailer < Devise::Mailer   
  helper :application 
  include Devise::Controllers::UrlHelpers 
  default template_path: 'devise/mailer'

  layout 'user_mailer'

  def reset_password_instructions(record, token, opts={})
  	@token = token
  	devise_mail(record, :reset_password_instructions, opts)
  	super
  end

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
    super
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
    super
  end

  def email_changed(record, opts={})
    devise_mail(record, :email_changed, opts)
    super
  end

  def password_change(record, opts={})
    devise_mail(record, :password_change, opts)
    super
  end
end