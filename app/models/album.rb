class Album < ActiveRecord::Base
  has_many :photos
  has_many :comments, :as => :commentable
  belongs_to :user

end
