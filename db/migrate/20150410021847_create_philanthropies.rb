class CreatePhilanthropies < ActiveRecord::Migration
  def change
    create_table :philanthropies do |t|
      t.integer :event, index: true, null: false
      t.float :total_raised, :decimal, precision: 2

      t.timestamps null: false
    end
    add_foreign_key :philanthropies, :event_ids
  end
end
