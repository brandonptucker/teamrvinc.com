class CreateRVs < ActiveRecord::Migration
  def change
    create_table :rvs do |t|
      t.string :condition
      t.string :type
      t.integer :year
      t.string :make
      t.string :model
      t.integer :length
      t.decimal :list_price
      t.decimal :price
      t.string :stock_number
      t.text :description

      t.timestamps
    end
  end
end
