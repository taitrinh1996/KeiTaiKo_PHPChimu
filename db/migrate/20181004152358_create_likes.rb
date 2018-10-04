class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, full: false
      t.integer :review_id, null: false

      t.timestamps
    end
  end
end
