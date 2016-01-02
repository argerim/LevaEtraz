class ChangeStringColumnMapsCities < ActiveRecord::Migration
  def change
    change_column :maps,   :name, :citext
    change_column :cities, :name, :citext

    add_index :maps,   :name, unique: true
    add_index :cities, :name, unique: true
  end
end
