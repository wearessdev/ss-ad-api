# frozen_string_literal: true

class Image < ActiveRecord::Base
  validates :file, :name, presence: true

  acts_as_paranoid

  def convert_to_file(school_id: nil, name: nil, file: nil)
    type = file[/[a-z]+;/].chop
    file = file.gsub(%r{^data:image/[a-z]+;base64,}, "")
    File.open("storage/#{school_id}_#{name}.#{type}", 'wb') do |f|
      f.write(Base64.decode64(file))
    end
    { file_name: "#{school_id}_#{name}.#{type}", path: "storage/#{school_id}_#{name}.#{type}" }
  end

  def article
    Article.find(self.article_id)
  end

  def event
    Event.find(self.event_id)
  end
end
