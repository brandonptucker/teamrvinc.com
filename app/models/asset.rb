class Asset < ActiveRecord::Base
  attr_accessible :asset
  belongs_to :rv
  has_attached_file :asset, 
  									:styles => { :small => "100x75>", :medium => "300x225>", :large => "600x450>" }, 
  									:processors => [:thumbnail, :compression]
  after_save :destroy_original_directory

	private
	def destroy_original_directory
		original_directory = File.dirname(self.asset.path)
		if Dir.exists?(original_directory)
			FileUtils.rm_rf(original_directory)
		end
	end
end