# frozen_string_literal: true

class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :school

  has_many :images
  has_many :categories
  acts_as_paranoid
end
