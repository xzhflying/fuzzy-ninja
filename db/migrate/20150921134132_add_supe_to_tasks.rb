class AddSupeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :supe, :string
  end
end
