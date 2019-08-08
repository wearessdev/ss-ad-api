class Article < ActiveRecord::Base
  belongs_to :author
  has_many :images
  belongs_to :school
  acts_as_paranoid
end
