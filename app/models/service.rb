class Service < ActiveRecord::Base
  attr_accessible :active, :name, :price, :image
  has_attached_file :image, :styles => { :small => "100x75>", :medium => "300x225>", :large => "600x450>" }
  validates :name, :price, :presence => true
  validates :price, :numericality => true
  validates :image, :attachment_presence => true
end
