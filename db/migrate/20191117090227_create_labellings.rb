class CreateLabellings < ActiveRecord::Migration[5.2]
  def change
    create_table :labellings do |t|
      t.bigint "task_id"
      t.bigint "label_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["label_id"], name: "index_labelings_on_label_id"
      t.index ["task_id"], name: "index_labelings_on_task_id"
    end
  end
end
