class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :comments

  has_attached_file :image, styles: {preview: '300x200>', thumb: '100x100>'}, :animated => false, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
