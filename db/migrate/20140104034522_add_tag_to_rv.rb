class AddTagToRV < ActiveRecord::Migration
  def change
    add_column :rvs, :tag, :text
  end
end
