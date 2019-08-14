# frozen_string_literal: true

class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :school

  has_many_attached :images
  has_and_belongs_to_many :categories
  acts_as_paranoid
end
