# frozen_string_literal: true

class Game < ActiveRecord::Base
  belongs_to :season
  acts_as_paranoid
end
