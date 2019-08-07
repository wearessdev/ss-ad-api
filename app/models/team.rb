class Team < ActiveRecord::Base
  belongs_to :school
  has_many :seasons
  has_many :games
  has_many :players
  has_many :staffs
end
