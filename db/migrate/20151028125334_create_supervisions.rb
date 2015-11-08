class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.belongs_to :mission, null: false, foreign_key: true
      t.belongs_to :supervisor, null: false, foreign_key: { references: :users }
      t.integer :accepted, null: false, default: 0
      t.timestamps null: false
    end

    add_index :supervisions, [:mission_id, :supervisor_id], unique: true
  end
end
