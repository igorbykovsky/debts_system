class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do
    render file: 'public/404.html', status: 404
  end
end
