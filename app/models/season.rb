# frozen_string_literal: true

class Season < ActiveRecord::Base
  belongs_to :team
  has_many :games
  acts_as_paranoid
end
