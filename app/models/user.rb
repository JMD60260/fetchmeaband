class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_one_attached :avatar
  after_create :welcome_send

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :age, numericality: { message: "%{value} seems wrong" }
  validates :description, length: { maximum: 1000 }
  validates :phone_number, length: { minimum: 2 }
<<<<<<< HEAD

=======
>>>>>>> 0bec007f25ebd3ffae5e937dfc136ba81947b00f
  
  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
