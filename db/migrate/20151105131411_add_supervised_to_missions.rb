class AddSupervisedToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :supervised, :integer, null: false, default: 0
  end
end
