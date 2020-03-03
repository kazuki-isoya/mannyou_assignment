class AddColumnTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :time_limit, :datetime, null: false, default: '2020-03-31 19:00:00'
  end

  def down
    remove_column :tasks, :time_limit, :datetime, null: false, default: '2020-03-31 19:00:00'
  end
end
