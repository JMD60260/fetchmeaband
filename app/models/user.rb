# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :forums
  has_many :events
  belongs_to :city, optional: true
  has_one_attached :avatar
  after_create :welcome_send

  acts_as_messageable

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Votre adresse email s'il-vous-plaît !" }
  validates :age, numericality: { message: '%{value} seems wrong' }, allow_nil: true, on: :update
  validates :description, length: { maximum: 1000 }, allow_nil: true, on: :update

  def mailboxer_name
    name
  end

  def mailboxer_email(_object)
    email
  end

  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
               update_attributes(params, *options)
             else
               assign_attributes(params, *options)
               valid?
               errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
    end

    clean_up_passwords
    result
end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
