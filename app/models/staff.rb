# frozen_string_literal: true

class Staff < ActiveRecord::Base
  belongs_to :team
  acts_as_paranoid
end
