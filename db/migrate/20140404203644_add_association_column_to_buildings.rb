class AddAssociationColumnToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :relationship, :boolean, default: true
  end
end
