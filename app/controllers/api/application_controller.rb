class API::ApplicationController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  respond_to :json

  def parse_body_json
    @attributes = JSON.parse(request.body.read)
  end

  def record_not_found
    head :not_found
  end
  
  # def api_token_valid?
  #   return unless params[:api_token].blank? || params[:api_token] != APP_CONFIG['api']['api_token']
  #   render :json => {:success => false, :message => "Missing or invalid API token"}, :status => 401
  # end
end
