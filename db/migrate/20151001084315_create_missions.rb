class CreateMissions < ActiveRecord::Migration
  def change
    drop_table :tasks

    create_table :missions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :supervisor, foreign_key: { references: :users }
      t.string :target, null: false
      t.string :description
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
