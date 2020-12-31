class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.base_url == 'https://localhost:3000'}
end
