# frozen_string_literal: true

class Event < ActiveRecord::Base
  has_many_attached :images
  belongs_to :school
  acts_as_paranoid
end
