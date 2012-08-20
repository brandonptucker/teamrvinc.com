class RenameTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :rvs, :type, :category
  end
end
