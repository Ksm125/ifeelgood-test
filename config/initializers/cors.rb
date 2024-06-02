# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  development_domains = %w[localhost:[0-9]+ 127.0.0.1:[0-9]+]
  allow do
    if Rails.env.production?
      origins 'ifeelgood.com'
    else
      origins(*development_domains.map { |s| %r{\Ahttps?://([a-zA-Z\d-]+\.)*#{s.gsub('.', '\.')}\z} })
    end

    resource '*', headers: :any, credentials: true, methods: [:get, :post, :patch, :put, :delete, :options]
  end
end
