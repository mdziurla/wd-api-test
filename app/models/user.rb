class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :database_authenticatable, :recoverable, :rememberable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :trackable
  devise  :registerable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :hobby # :email, :password, :password_confirmation, :remember_me
end
