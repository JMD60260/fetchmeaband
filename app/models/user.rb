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
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, numericality: { message: "%{value} seems wrong" }, :allow_nil => true, on: :update
  validates :description, length: { maximum: 1000 }, :allow_nil => true, on: :update
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
    end
  end
  after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
   
  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
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

  def address
    [city.name, city.zip_code].compact.join(', ')
  end
end
