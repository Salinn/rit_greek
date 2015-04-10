class CreatePhilanthropies < ActiveRecord::Migration
  def change
    create_table :philanthropies do |t|
      t.belongs_to :event, index: true
      t.float :total_raised

      t.timestamps null: false
    end
    add_foreign_key :philanthropies, :events
  end
end
