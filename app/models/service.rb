class Service < ActiveRecord::Base
  attr_accessible :active, :name, :price, :image
  has_attached_file :image, :styles => { :medium => "200x150>" }
  validates :name, :price, :presence => true
  validates :price, :numericality => true
  validates :image, :attachment_presence => true
end
