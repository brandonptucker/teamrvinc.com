class RV < ActiveRecord::Base
  attr_accessible :condition, :description, :length, :list_price, :make, :model, :price, :stock_number, :category, :year, :assets_attributes, :cost, :tag
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  validates :condition, :category, :year, :make, :model, :length, :list_price, :price, :stock_number, :description, :cost, :presence => true
  validates :year, :cost, :list_price, :price, :numericality => true
  validates :year, :length => { :is => 4}
  validates :length, :length => { :is => 2}
  serialize :tag, Hash

  def get_default_payment()
  	interest_rate = 6.0
  	years = self.condition == "New" ? 10 : 7
  	
  	r = (6.0/12)/100
  	n = years * 12
  	p = self.price

  	(r * p) / (1 - ((1 + r) ** -n))
  end
end