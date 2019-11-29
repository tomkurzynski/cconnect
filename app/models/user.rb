class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
    end

has_many :orders

protected
def confirmation_required?
  false
end

 



end
