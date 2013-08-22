ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :domain => 'gmail.com',
  :user_name => 'sw5813',
  :password => 'extra12345',
  :enable_starttls_auto => true
}