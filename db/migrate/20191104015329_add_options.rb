class AddOptions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :deadline, false
    change_column_null :tasks, :status, false
    change_column_null :tasks, :priority, false
  end
end
