class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|
      t.belongs_to :user_id, index: true
      t.belongs_to :organization_id, index: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
    add_foreign_key :user_organizations, :user_ids
    add_foreign_key :user_organizations, :organization_ids
  end
end
