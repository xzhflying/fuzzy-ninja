class CreateMissions < ActiveRecord::Migration
  def change
    drop_table :tasks

    create_table :missions do |t|
      t.references :missions, index: true, foreign_key: true
      t.string :target
      t.string :description
      t.string :status

      t.timestamps null: false
    end
  end
end
