class AddCompletedToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :completed, :integer, null: false, default: 0
  end
end
