class CreateMissions < ActiveRecord::Migration
  def change
    drop_table :tasks

    create_table :missions do |t|
      t.string :target
      t.string :description
      t.string :status
      t.timestamps null: false
      t.references :missions, index: true, foreign_key: true
    end
  end
end
