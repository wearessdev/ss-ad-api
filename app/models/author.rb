class Author < ActiveRecord::Base
  belongs_to :school
  has_many :articles
  acts_as_paranoid
end
