class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :hobby # :remember_me
  
  def update_through_api(attrs)
    allowed_attributes = ['first_name', 'last_name', 'hobby']
    attrs.reject! {|k,v| !allowed_attributes.include?(k)}

    update_attributes attrs
  end
end
