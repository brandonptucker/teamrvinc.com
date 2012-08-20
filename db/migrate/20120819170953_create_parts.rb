class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.decimal :list_price
      t.decimal :price
      t.string :part_number
      t.text :description

      t.timestamps
    end
  end
end
