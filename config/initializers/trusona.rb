Trusona.config do |c|
  c.secret         = Rails.application.credentials.trusona[:secret]
  c.token          = Rails.application.credentials.trusona[:token]
end
