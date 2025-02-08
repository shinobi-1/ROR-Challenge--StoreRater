class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         USER = 0
         OWNER = 1
         ADMIN = 2
       
         # Validations
         validates :name, presence: true, length: { minimum: 5, maximum: 60 }
         validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
         validates :address, presence: true, length: { maximum: 400 }
         validates :password, presence: true, length: { minimum: 8, maximum: 16 }, format: {
           with: /\A(?=.*[A-Z])(?=.*\W).{8,16}\z/,
           message: "must be 8-16 characters long, include 1 uppercase letter, and 1 special character"
         }
       
         before_create :set_default_role
       
         # Role Helper Methods
         def admin?
           role == ADMIN
         end
       
         def owner?
           role == OWNER
         end
       
         def user?
           role == USER
         end
       
         private
       
         def set_default_role
           self.role ||= USER  # Default to normal user
         end
       
       

end
