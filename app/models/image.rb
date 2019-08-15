# frozen_string_literal: true

class Image < ActiveRecord::Base
  has_one_attached :data
  validates :file, :name, presence: true

  acts_as_paranoid

  def convert_to_file(school_id: nil, name: nil, file: nil)
    return nil if !file.include? "data:image/"

    type = file[/[a-z]+;/].chop
    file = file.gsub(%r{^data:image/[a-z]+;base64,}, "")
    File.open("storage/#{school_id}_#{name}.#{type}", 'wb') do |f|
      f.write(Base64.decode64(file))
    end
    data = { file_name: "#{school_id}_#{name}.#{type}", path: "storage/#{school_id}_#{name}.#{type}" }

    self.data.attach(
      io: File.open(data[:path]),
      filename: data[:file_name]
    )
    true
  end
end
