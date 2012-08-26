class Asset < ActiveRecord::Base
  attr_accessible :asset
  belongs_to :rv
  has_attached_file :asset, :styles => { :small => "100x75>", :medium => "300x225>", :large => "600x450>" }
end