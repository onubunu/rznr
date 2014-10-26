ActionMailer::Base.smtp_settings = {
    address: ENV["MAIL_ADDRESS"],
    port: ENV["MAIL_PORT"],
    domain: ENV["MAIL_DOMAIN"],
    authentication: ENV["MAIL_AUTHENTICATION"],
    enable_starttls_auto: ENV["MAIL_ENABLE_STARTTLS_AUTO"],
    user_name: ENV["MAIL_USERNAME"],
    password: ENV["MAIL_PASSWORD"]
}


