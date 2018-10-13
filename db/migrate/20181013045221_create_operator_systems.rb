class CreateOperatorSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :operator_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end
