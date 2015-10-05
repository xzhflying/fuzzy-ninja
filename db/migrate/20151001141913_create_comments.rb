class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :mission, null: false, foreign_key: true

      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
