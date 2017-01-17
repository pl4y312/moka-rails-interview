class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  EMAIL_REGEX = /.+@.+\..+/i

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true, uniqueness: true, :format => EMAIL_REGEX
  validates :password, presence: true, confirmation: true
  validates_length_of :password, :in => 6..20
  validates :password_confirmation, presence: true
end
