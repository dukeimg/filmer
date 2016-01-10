class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  has_many :comments

end
