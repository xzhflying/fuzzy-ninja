class CreateMissionComments < ActiveRecord::Migration
  def change
    create_table :mission_comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :commentable, null: false, polymorphic: true

      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
