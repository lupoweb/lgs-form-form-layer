class UserMailerPreview < ActionMailer::Preview 
  
  def reset_password_instructions
    UserMailer.reset_password_instructions(User.first, "faketoken", {})
  end

  def confirmation_instructions
    UserMailer.confirmation_instructions(User.first, "faketoken", {})
  end

  def email_changed
    UserMailer.email_changed(User.first, {})
  end

  def password_changed
    UserMailer.password_change(User.first, {})
  end

  def unlock_instructions
    UserMailer.unlock_instructions(User.first, "faketoken", {})
  end
  
end
