class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do |msg|
    respond_to do |format|
      format.json { head :not_found, content_type: 'text/html' }
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
    end
  end

  rescue_from ActionController::ParameterMissing do |exception|
    respond_to do |format|
      format.json { head :bad_request, content_type: 'text/html' }
      format.html { render file: "#{Rails.root}/public/422", layout: false, status: :bad_request }
    end
  end

  rescue_from CanCan::AccessDenied do |msg|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { render file: "#{Rails.root}/public/403", layout: false, status: :forbidden }
    end
  end
end
