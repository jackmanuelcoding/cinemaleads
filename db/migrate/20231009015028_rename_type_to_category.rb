class RenameTypeToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :leads, :type, :category
  end
end
