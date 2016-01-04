class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :comments

  has_attached_file :file, styles: {preview: '300x200>', thumb: '100x100>'}, :animated => false
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
end
