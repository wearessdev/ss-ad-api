class Event < ActiveRecord::Base
  has_many :images
  belongs_to :school
  acts_as_paranoid
end
