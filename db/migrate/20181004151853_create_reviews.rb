class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.string :picture
      t.integer :screen_size
      t.string :operator_system_id
      t.string :cpu
      t.string :battery
      t.integer :brand_id, null: false
      t.integer :price, default: 0
      t.text :review
      t.integer :user_id, null: false
      t.boolean :is_confirm, default: 0

      t.timestamps
    end
  end
end
