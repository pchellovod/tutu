class AddOrderCarriagesToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order_carriages, :boolean
  end
end
