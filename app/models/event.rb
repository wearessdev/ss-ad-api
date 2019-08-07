class Event < ActiveRecord::Base
  has_many :images
  belongs_to :school
end
