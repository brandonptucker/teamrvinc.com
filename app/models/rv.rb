class RV < ActiveRecord::Base
  attr_accessible :condition, :description, :length, :list_price, :make, :model, :price, :stock_number, :category, :year
end