class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.belongs_to :user_id, index: true
      t.belongs_to :event_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_events, :user_ids
    add_foreign_key :user_events, :event_ids
  end
end
