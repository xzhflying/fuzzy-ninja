class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :target, null: false
      t.text :description
      t.datetime :deadline
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
