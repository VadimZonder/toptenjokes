class User < ActiveRecord::Base
def user_params
    
  params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)  
    
end
         has_many:orders
         
         
  has_secure_password
  has_many :posts, dependent: :destroy
  
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"
  end
  
  
end