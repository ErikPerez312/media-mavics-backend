class User < ApplicationRecord
  # learn more about salts and hashes
  has_many :campaigns
  validates :name, :phone_number, :business_name, presence: true
  validates :email, presence: true, uniqueness: true

  before_save :encrypt_password   # 1. Hash password before saving a User
  before_create :generate_token # 2. Generate a token for authentication before creating a User
  attribute :password, :string # 3. Adds a virtual password field, which we will use when creating a user

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Generates a token for a user
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen
    token_gen
  end
end
