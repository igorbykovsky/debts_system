class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do
    render file: 'public/404.html', status: 404
  end

  add_flash_types :success, :danger, :info, :warning

  before_action :set_locale

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end
end
