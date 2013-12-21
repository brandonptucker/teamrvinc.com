class SitemapController < ApplicationController
  def index
  	@rvs = RV.all
  	@parts = Part.all
  	@services = Service.all
  	respond_to do |format|
  		format.xml
  	end
  end
end
