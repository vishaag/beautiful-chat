class RenameTypeToGroupTypeinTableGroup < ActiveRecord::Migration[5.1]
  def change
    rename_column :groups, :type, :group_type
  end
end
