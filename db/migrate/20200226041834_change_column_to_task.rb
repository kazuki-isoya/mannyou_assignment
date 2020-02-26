class ChangeColumnToTask < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :title, :string, null: false
    change_column :tasks, :content, :text, null: false
    change_column_default :tasks, :title, nil
    change_column_default :tasks, :content, nil
  end

  def down
    change_column :tasks, :title, :string, null: true
    change_column :tasks, :content, :text, null: true
  end
end
