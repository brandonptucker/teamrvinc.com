class AddConditionToParts < ActiveRecord::Migration
  def change
    add_column :parts, :condition, :string
  end
end
