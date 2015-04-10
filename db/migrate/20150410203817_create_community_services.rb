class CreateCommunityServices < ActiveRecord::Migration
  def change
    create_table :community_services do |t|
      t.belongs_to :event, index: true
      t.float :total_hours

      t.timestamps null: false
    end
    add_foreign_key :community_services, :events
  end
end
