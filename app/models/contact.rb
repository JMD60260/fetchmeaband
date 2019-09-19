class Contact < ApplicationRecord
attr_accessor :firstname, :lastname, :email, :message
 
  validates :lastname, :firstname, :email, :content, presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true
include ActiveModel::Validations
include ActiveModel::Conversion
extend  ActiveModel::Naming
 
    def persisted?
    false
    end
 
    def initialize(attributes = {})
        attributes.each do |name, value|
        send("#{name}=", value)
        end
    end
end
