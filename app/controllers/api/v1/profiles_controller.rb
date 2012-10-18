class Api::V1::ProfilesController < API::V1::ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :parse_body_json, :only => [:update]
  before_filter :ensure_params_exist, :only => [:update]
  before_filter :load_profile, :except => [:index]
  
  def index
    @profiles = User.all
    render :json => {:profiles => @profiles.as_json(:only => [:first_name, :last_name, :hobby])}
  end

  def show
    render :json => {:profile => @profile.as_json(:only => [:first_name, :last_name, :hobby])}
  end
  
  def edit
    render :json => {:profile => @profile.as_json}
  end
  
  def update
    if @profile.update_through_api(@attributes['user'])
      render :json => {:success => true, :message => "User profile was successfully updated"}, :status => 200
    else
      render :json => {:success => false, :message => "Error when updating the user profile"}, :status => 422
    end    
  end
  
  def destroy
    @profile.destroy
    render :json => {:success => true, :message => "User profile was successfully deleted"}, :status => 200
  end  
  
  private
  
  def load_profile
    @profile = User.find(params[:id])
  end
  
  def ensure_params_exist
    return unless @attributes['user'].blank?
    render :json => {:success => false, :message => "Missing user parameter"}, :status => 422
  end
end
