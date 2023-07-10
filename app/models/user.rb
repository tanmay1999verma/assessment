class User < ApplicationRecord
  require 'digest'

  has_many :blogs
  PHONE_NUMBER_REGEX = /\A[5-9][0-9]{9}\z/.freeze
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
            format: {with: /\A(?=.*\d)(?=.*[A-z])(?=.*\W)[^ ]{8,}\z/}
  validates :phone_number, presence: true,
            format: {with: User::PHONE_NUMBER_REGEX}


  def authenticate(password)
    self.password == encrypted_pass(password)
  end

  def encrypt_password(password)
    self.password = encrypted_pass(password) if password.present?
  end

  private

  def encrypted_pass(string)
    Digest::SHA256.hexdigest(string)
  end
end
