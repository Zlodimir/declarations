module ActionMailer
  CONFIG = YAML.load_file(File.join(Rails.root, 'config', 'action_mailer.yml'))[Rails.env]

  Base.smtp_settings = {
      port:           CONFIG['port'],
      address:        CONFIG['address'],
      user_name:      CONFIG['user_name'],
      password:       CONFIG['password'],
      domain:         CONFIG['domain'],
      authentication: :login,
  }

  Base.default_options = { from: CONFIG['default_from'] }
  Base.default_url_options = { host: CONFIG['default_url_host'] }
end
