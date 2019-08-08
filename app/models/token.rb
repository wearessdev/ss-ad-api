# frozen_string_literal: true

class Token < ActiveRecord::Base
  belongs_to :user
  validates :token, presence: true
  acts_as_paranoid

  def new_token(user, token)
    self.user_id = user.id
    self.token = token
    self.save
    self
  end
end
