class ContactMailer < ActionMailer::Base
  default to: Proc.new { User.where(admin: true).pluck(:email) }
  default from: "sw5813@gmail.com"

  def contact_message(message)
  	@message = message
  	mail(subject: "#{@message.subject}")
  end
end
