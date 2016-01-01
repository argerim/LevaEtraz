class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.integer :distance

      t.timestamps null: false
    end
    add_index "routes", ["origin_id"], name: "index_routes_on_origin_id"
    add_index "routes", ["destination_id", "origin_id"], name: "index_routes_on_destination_id_and_origin_id"
    add_index "routes", ["destination_id"], name: "index_routes_on_destination_id"
  end
end
