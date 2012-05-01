class User < ActiveRecord::Base

  ROLES = {
    :linker => "linker",
    :admin => "admin"
  }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname

  has_many :links
  before_validation :define_role

  def admin?
    self.role== ROLES[:admin]
  end

  def linker?
    self.role== ROLES[:linker]
  end

protected
  def define_role
    self.role = ROLES[:linker] if self.role.blank?
  end
end
