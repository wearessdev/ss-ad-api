# frozen_string_literal: true

class Event < ActiveRecord::Base
  has_many :images
  belongs_to :school
  acts_as_paranoid
end
