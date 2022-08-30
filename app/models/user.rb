class User < ApplicationRecord
  has_secure_password

  before_validation :convert_lower

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5, maximum: 50 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end

def authenticate_with_credentials(email, password)
  user = User.find_by_email(email.strip.downcase)
  if user && user.authenticate(password)
    user
  else
    nil
  end
end


def convert_lower
  if email
    self.email = email.strip.downcase
  end
end
