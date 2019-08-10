# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  acts_as_paranoid

  belongs_to :school
  has_one :token

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
