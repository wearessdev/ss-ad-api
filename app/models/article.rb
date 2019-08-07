class Article < ActiveRecord::Base
  has_one :author
  has_many :images
  belongs_to :school
end
