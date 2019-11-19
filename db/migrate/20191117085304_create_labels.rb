class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string "name", null:false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id", name: "index_labels_on_user_id"
    end
  end
end
