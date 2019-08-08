class Game < ActiveRecord::Base
  belongs_to :team
  acts_as_paranoid
end
