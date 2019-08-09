# frozen_string_literal: true

class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  acts_as_paranoid
end
