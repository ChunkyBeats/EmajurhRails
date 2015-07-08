class Image < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title

  has_attached_file :attachment, :styles => { :thumb => "250x250" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
