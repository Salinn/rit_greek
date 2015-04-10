class CreateCommunityServices < ActiveRecord::Migration
  def change
    create_table :community_services do |t|
      t.integer :event, index: true
      t.float :total_hours, :decimal, precision: 2

      t.timestamps null: false
    end
    add_foreign_key :community_services, :event_ids
  end
end
