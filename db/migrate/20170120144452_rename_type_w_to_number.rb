class RenameTypeWToNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :type_w, :number
  end
end
