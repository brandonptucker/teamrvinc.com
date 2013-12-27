class Service < ActiveRecord::Base
  attr_accessible :active, :name, :price, :image, :description
  has_attached_file :image, :styles => { :small => "100x75>", :medium => "300x225>", :large => "600x450>" }, 
  	:processors => [:compression]
  validates :description, :name, :price, :presence => true
  validates :price, :numericality => true
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
