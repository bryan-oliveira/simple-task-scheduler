class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Downcase emails to normalize comparisons
  before_save :downcase_email

  # Method reference
  before_create :create_activation_digest


  # Mandatory name attribute
  validates :name,  presence: true, length: { maximum: 50 }

  # Mandatory email attribute with correct form a@b.c
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
