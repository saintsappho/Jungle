class User < ApplicationRecord
  has_secure_password
  
  validates :email, uniqueness: {case_sensitive: false, message: "already exists in system!"}
  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.downcase.strip)
    user if user&.authenticate(password)
  end

  
end
