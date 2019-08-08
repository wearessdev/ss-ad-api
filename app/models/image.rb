class Image < ActiveRecord::Base
  belongs_to :article
  belongs_to :event
  acts_as_paranoid
end
