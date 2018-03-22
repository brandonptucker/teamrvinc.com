class RV < ActiveRecord::Base
  attr_accessible :condition, :description, :length, :list_price, :make, :model, :price, :stock_number, :category, :year, :assets_attributes, :cost, :tag
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  validates :condition, :category, :year, :make, :model, :length, :list_price, :price, :stock_number, :description, :cost, :presence => true
  validates :year, :cost, :list_price, :price, :numericality => true
  validates :year, :length => { :is => 4}
  validates :length, :length => { :is => 2}
  serialize :tag, Hash

  def get_default_interest_rate()
    5.9
  end

  def get_default_term()
    case self.price
    when 0..10000.00
      7
    when 10000.01..25000.00
      10
    when 25000.01..50000.00
      15
    else
      20
    end
  end

  def get_default_down_payment()
    self.price * 0.10
  end

  def get_default_payment()
  	
  	r = (get_default_interest_rate() / 12) / 100
  	n = get_default_term() * 12
  	p = self.price - get_default_down_payment()

  	(r * p) / (1 - ((1 + r) ** -n))
  end

  def get_max_assets()
    15
  end

end