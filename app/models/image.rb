class Image < ActiveRecord::Base
  belongs_to :article
  belongs_to :event
end
