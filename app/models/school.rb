# frozen_string_literal: true

class School < ActiveRecord::Base
  has_many :users
  has_many :teams
  has_many :staffs
  has_many :articles
  has_many :events
  has_many :authors
  acts_as_paranoid
end
