class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :comments, :as => :commentable

  before_create :default_title

  has_attached_file :image, styles: {preview: '500x500>', thumb: '250x250>'}, :animated => false, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def default_title
    self.title ||= File.basename(image_file_name, '.*').titleize if image
  end
end
