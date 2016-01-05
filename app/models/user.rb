class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :films
  has_many :photos
  has_many :albums
  has_many :comments

  has_attached_file :avatar, styles: {preview: '600x600>',  medium: "250x250#", thumb: "50x50#" },
                    default_url: "/images/:style/missing.png",
                    :animated => false,
                    :processors => [:cropper]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    avatar_path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
  end

  private

  def reprocess_avatar
    avatar.reprocess!
  end
end