# frozen_string_literal: true

class Category < ActiveRecord::Base
  has_many :articles
  acts_as_paranoid
end
