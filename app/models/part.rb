class Part < ActiveRecord::Base
  attr_accessible :condition, :description, :list_price, :name, :part_number, :price, :image
  has_attached_file :image, 
  									:styles => { :small => "100x75>", :medium => "300x225>", :large => "600x450>" }, 
  									:processors => [:thumbnail, :compression]
  validates :condition, :description, :list_price, :name, :part_number, :price, :presence => true
  validates :list_price, :price, :numericality => true
  validates :image, :attachment_presence => true
  after_save :destroy_original_directory

	private
	def destroy_original_directory
		original_directory = File.dirname(self.image.path)
		if Dir.exists?(original_directory)
			FileUtils.rm_rf(original_directory)
		end
	end
end
