class AddColumnToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :owner_id, :integer
  end
end
