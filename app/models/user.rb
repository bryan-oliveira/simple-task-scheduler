class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Downcase emails to normalize comparisons
  before_save :downcase_email

  # Mandatory email attribute with correct form a@b.c
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Mandatory password attribute
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  private

  # Converts email to all lower-case.
  def downcase_email
    email.downcase!
  end

end
