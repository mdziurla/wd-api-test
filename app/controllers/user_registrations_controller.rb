class UserRegistrationsController < Devise::RegistrationsController

  def create
    respond_to do |format|
      # format.html {
      #   build_resource
      #   if verify_recaptcha
      #     if resource.save
      #       session[:omniauth] = nil unless @user.new_record?
      #       set_flash_message :notice, :signed_up
      #       sign_in_and_redirect(resource_name, resource)
      #     else
      #       clean_up_passwords(resource)
      #       render_with_scope :new
      #     end
      #   else
      #     set_flash_message :alert, :wrong_captcha
      #     clean_up_passwords(resource)
      #     render_with_scope :new
      #   end
      # }
      format.json {
        build_resource
        if resource.save
          render :json => resource, :status => 201
        else
          render :json => resource.errors, :status => 422
        end
      }
    end
  end
  
  private
  
  def build_resource(*args)
    super
    # if session[:omniauth]
    #   @user.apply_omniauth(session[:omniauth])
    #   @user.valid?
    # end
  end  
end