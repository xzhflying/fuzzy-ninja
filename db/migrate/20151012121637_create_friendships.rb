class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.integer :accepted, null: false, default: 0

      t.timestamps null: false
    end

    add_reference :friendships, :friend, null: false, references: :users
    add_index :friendships, [:friend_id, :user_id], unique: true
  end
end
