class AddCostToRVs < ActiveRecord::Migration
  def change
    add_column :rvs, :cost, :decimal
  end
end
