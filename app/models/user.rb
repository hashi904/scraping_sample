class User < ApplicationRecord
  has_secure_password
  has_secure_token

  # validations
  validates_presence_of :name, :email, :password
  validates_length_of :name, minimum: 5, maximum: 20
  validates_length_of :email, minimum: 5, maximum: 20
  validates_length_of :password, minimum: 5, maximum: 20

end
