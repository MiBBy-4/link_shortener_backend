class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, confirmation: { case_sensitive: false }

  has_many :links
  has_many :tags
end
