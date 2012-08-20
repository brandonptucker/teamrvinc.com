class Part < ActiveRecord::Base
  attr_accessible :description, :list_price, :name, :part_number, :price, :image
  has_attached_file :image, :styles => { :medium => "300x225>", :large => "600x450>" }
  validates :description, :list_price, :name, :part_number, :price, :presence => true
  validates :list_price, :price, :numericality => true
  validates :image, :attachment_presence => true
end
